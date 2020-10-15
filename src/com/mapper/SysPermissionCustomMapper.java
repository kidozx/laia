package com.mapper;

import java.util.List;

import com.pojo.SysPermission;
import com.pojo.TreeMenu;

public interface SysPermissionCustomMapper {

	
	public List<TreeMenu> getTreeMenu();
	
	public List<SysPermission> getSubMenu(int id);
}
