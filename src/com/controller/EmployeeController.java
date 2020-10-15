package com.controller;

import com.pojo.*;
import com.service.EmployeeService;

import com.service.SysService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService emService;

    @Autowired
    private SysService syservice;


    @RequestMapping("/index")
    public String index(Model model, HttpSession session){
        ActiveUser activeUser = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
        String dept=syservice.findRole(activeUser.getUsername());

        model.addAttribute("activeUser", activeUser);
        session.setAttribute("activeUser",activeUser);
        session.setAttribute("dept", dept);
        return "layout";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest request,Model model){
        String errorMsg = (String) request.getAttribute("shiroLoginFailure");
        if(errorMsg!=null){
            if(UnknownAccountException.class.getName().equals(errorMsg)) model.addAttribute("errorMsg", "你号呢？");
            else if(IncorrectCredentialsException.class.getName().equals(errorMsg)) model.addAttribute("errorMsg","密码错了傻狗");
            else if("randomcodeError".equals(errorMsg))  model.addAttribute("errorMsg", "验证码不正确");
            else model.addAttribute("errorMsg","完蛋了死机了");
        }

        return "login";
    }

    /*
	 * SELECT e1.*,e2.name FROM employee e1 INNER JOIN employee e2
			WHERE e1.manager_id=e2.id;
	 * */
    @RequestMapping("/findUserList")
    public String findUserList(Model mv) {

        List<SysRole> allRoles = syservice.findAllRoles();
        List<EmployeeCustom> userAndRoleList = emService.findUserAndRoleList();

        mv.addAttribute("userList", userAndRoleList);
        mv.addAttribute("allRoles", allRoles);


        return "userlist";
    }

    @RequestMapping("/assignRole")
    @ResponseBody
    public Map<String, String> assignRole(String roleId,String userId) {
        Map<String, String> map = new HashMap<>();
        try {
            emService.updateEmployeeRole(roleId, userId);
            map.put("msg", "分配权限成功");
        } catch (Exception e) {
            e.printStackTrace();
            map.put("msg", "分配权限失败");
        }
        return map;
    }

    @RequestMapping("/toAddRole")
    public ModelAndView toAddRole() {
        List<MenuTree> allPermissions = syservice.loadMenuTree();

        List<SysPermission> menus = syservice.findAllMenus();

        List<SysRole> permissionList = syservice.findRolesAndPermissions();
        System.out.println(permissionList.get(2).getPermissionList());
        ModelAndView mv = new ModelAndView();
        mv.addObject("allPermissions", allPermissions);
        mv.addObject("menuTypes", menus);
        mv.addObject("roleAndPermissionsList", permissionList);
        mv.setViewName("rolelist");

        return mv;

    }

    @RequestMapping("/saveRoleAndPermissions")
    public String saveRoleAndPermissions(SysRole role,int[] permissionIds) {
        //设置role主键，使用uuid
        //String uuid = UUID.randomUUID().toString();
        //role.setId(uuid);
        //默认可用
        role.setAvailable("1");

        syservice.addRoleAndPermissions(role, permissionIds);

        return "redirect:/toAddRole";
    }

    @RequestMapping("/saveSubmitPermission")
    public String saveSubmitPermission(SysPermission permission) {
        if (permission.getAvailable() == null) {
            permission.setAvailable("0");
        }
        syservice.addSysPermission(permission);
        return "redirect:/toAddRole";
    }

    @RequestMapping("/findRoles")  //rest
    public ModelAndView findRoles() {
        ActiveUser activeUser = (ActiveUser) SecurityUtils.getSubject().getPrincipal();
        List<SysRole> roles = syservice.findAllRoles();
        List<MenuTree> allMenuAndPermissions = syservice.getAllMenuAndPermision();

        ModelAndView mv = new ModelAndView();
        mv.addObject("allRoles", roles);
        mv.addObject("activeUser",activeUser);
        mv.addObject("allMenuAndPermissions", allMenuAndPermissions);

        mv.setViewName("permissionlist");
        return mv;
    }

    @RequestMapping("/loadMyPermissions")
    @ResponseBody
    public List<SysPermission> loadMyPermissions(String roleId) {
        List<SysPermission> list = syservice.findPermissionsByRoleId(roleId);

        for (SysPermission sysPermission : list) {
            System.out.println(sysPermission.getId()+","+sysPermission.getType()+"\n"+sysPermission.getName() + "," + sysPermission.getUrl()+","+sysPermission.getPercode());
        }
        return list;
    }

    @RequestMapping("/updateRoleAndPermission")
    public String updateRoleAndPermission(String roleId,int[] permissionIds) {
        syservice.updateRoleAndPermissions(roleId, permissionIds);
        return "redirect:/findRoles";
    }

    @RequestMapping("/viewPermissionByUser")
    @ResponseBody
    public SysRole viewPermissionByUser(String userName) {
        SysRole sysRole = syservice.findRolesAndPermissionsByUserId(userName);

        System.out.println(sysRole.getName()+"," +sysRole.getPermissionList());
        return sysRole;
    }

    @RequestMapping("/saveUser")
    public String saveUser(Employee user) {

        SimpleHash simpleHash = new SimpleHash("MD5", user.getPassword(), "eteokues", 2);
        System.out.println(simpleHash.toString());
        user.setPassword(simpleHash.toString());
        user.setSalt("eteokues");

        String name = user.getName();
        Integer role = user.getRole();
        SysUserRole sysUserRole = new SysUserRole();
        Random ran=new Random(20);
        Integer i = ran.nextInt();

        sysUserRole.setId( i.toString());
        sysUserRole.setSysUserId(name);
        sysUserRole.setSysRoleId(role.toString());
        emService.saveEmployee(user);
        syservice.saveEmp(sysUserRole);
        return "redirect:/findUserList";
    }

    @RequestMapping("/findNextManager")
    @ResponseBody
    public List<Employee> findNextManager(int level) {
        level++; //加一，表示下一个级别
        List<Employee> list = emService.findEmployeeByLevel(level);
        System.out.println(list);
        return list;

    }

}
