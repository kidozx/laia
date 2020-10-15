package com.realm;


import com.pojo.MenuTree;
import com.pojo.SysPermission;
import com.service.EmployeeService;
import com.service.SysService;
import com.pojo.ActiveUser;
import com.pojo.Employee;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class myrealm extends AuthorizingRealm {

    @Autowired
    private EmployeeService emservice;

    @Autowired
    private SysService sysService;

    @Override
    public String getName() {
        return "我的realm噢";
    }
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String username = authenticationToken.getPrincipal().toString();
        //假设仿问数据库


        Employee user = null;
        try {
            user = emservice.findEmployeeByName(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (user == null) {
            return null; // UnknownAccountException
        }


        List<MenuTree> menuTree = sysService.loadMenuTree();

        //把用户的身份信息重新封装
        ActiveUser activeUser = new ActiveUser();
        activeUser.setId(Integer.parseInt(String.valueOf(user.getId())));
        activeUser.setUserid(user.getName());

        activeUser.setUsername(user.getName());
        activeUser.setManagerId(user.getManagerId());
        activeUser.setMenuTree(menuTree);

        String password_db = user.getPassword();    // 数据库中的密码,密文
        System.out.println(password_db);
        String salt = user.getSalt();
        System.out.println(salt);

        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(activeUser, password_db,  ByteSource.Util.bytes(salt), getName());
        return info;
    }
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        ActiveUser activeUser = (ActiveUser) principalCollection.getPrimaryPrincipal();
        //查询数据库认证用户拥有的角色和权限
        List<SysPermission> permissions = null;
        try {
            permissions = sysService.findPermissionListByUserId(activeUser.getUsername());
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<String> permisionList = new ArrayList<>();
        for (SysPermission sysPermission : permissions) {
            permisionList.add(sysPermission.getPercode());
        }

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.addStringPermissions(permisionList);

        return info;
    }
}
