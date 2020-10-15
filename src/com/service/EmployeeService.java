package com.service;

import com.pojo.Employee;
import com.pojo.EmployeeCustom;

import java.util.List;

public interface EmployeeService {
    //根据员工帐号查找员工
    Employee findEmployeeByName(String name);

    //根据主键查找员工
    Employee findEmployeeManager(long id);

    List<Employee> findUsers();

    List<EmployeeCustom> findUserAndRoleList();

    void updateEmployeeRole(String roleId,String userId);

    List<Employee> findEmployeeByLevel(int  level);

    int saveEmployee(Employee user);

}
