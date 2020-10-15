package com.service;

import java.util.List;


import com.pojo.MenuTree;
import com.pojo.SysPermission;
import com.pojo.SysRole;
import com.pojo.SysUserRole;


public interface SysService {
	//根据用户id查询职位
	String findRole(String userid);
	//根据用户id查询权限范围的菜单
	public List<SysPermission> findMenuListByUserId(String userid) throws Exception;
	
	//根据用户id查询权限范围的url
	public List<SysPermission> findPermissionListByUserId(String userid) throws Exception;
	
	public List<MenuTree> loadMenuTree();
	
	public List<SysRole> findAllRoles();
	
	public SysRole findRolesAndPermissionsByUserId(String userId);
	
	public void addRoleAndPermissions(SysRole role,int[] permissionIds);
	
	//查询所有menu类permission
	public List<SysPermission> findAllMenus();
	
	public void addSysPermission(SysPermission permission);
	
	//根据用户ID查询其所有的菜单和权限
	public List<SysPermission> findMenuAndPermissionByUserId(String userId);
	public List<MenuTree> getAllMenuAndPermision();
	
	//根据角色ID查询权限
	public List<SysPermission> findPermissionsByRoleId(String roleId);
	
	public void updateRoleAndPermissions(String roleId,int[] permissionIds);

	public List<SysRole> findRolesAndPermissions();

	public int saveEmp(SysUserRole userRole);
}
