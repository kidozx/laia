package com.service.impl;

import com.mapper.EmployeeMapper;
import com.mapper.SysPermissionMapperCustom;
import com.mapper.SysUserRoleMapper;
import com.pojo.*;
import com.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceimpl implements EmployeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    @Autowired
    private SysPermissionMapperCustom permissionMapper;
    @Autowired
    private SysUserRoleMapper userRoleMapper;

    @Override
    public Employee findEmployeeByName(String name) {
        EmployeeExample example=new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andNameEqualTo(name);

        System.out.println(employeeMapper);
        List<Employee> list = employeeMapper.selectByExample(example);

//        if(list!=null&&list.size()>0){
//            return list.get(0);
//        }
        System.out.println("WTNM2");
        return list.get(0);
    }

    @Override
    public Employee findEmployeeManager(long id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Employee> findUsers() {
        return employeeMapper.selectByExample(null);
    }

    @Override
    public List<EmployeeCustom> findUserAndRoleList() {
        return permissionMapper.findUserAndRoleList();
    }

    @Override
    public void updateEmployeeRole(String roleId, String userId) {
        SysUserRoleExample example = new SysUserRoleExample();
        SysUserRoleExample.Criteria criteria = example.createCriteria();
        criteria.andSysUserIdEqualTo(userId);

        SysUserRole userRole = userRoleMapper.selectByExample(example).get(0);
        userRole.setSysRoleId(roleId);

        userRoleMapper.updateByPrimaryKey(userRole);
    }

    @Override
    public List<Employee> findEmployeeByLevel(int  level) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andRoleEqualTo(level);
        List<Employee> list = employeeMapper.selectByExample(example);

        return list;
    }

    @Override
    public int saveEmployee(Employee user) {

        return employeeMapper.insert(user);
    }


}
