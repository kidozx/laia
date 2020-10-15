<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>流程管理</title>
	<link rel="stylesheet" href="static/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="static/febs/css/febs.css" media="all">
	<link rel="stylesheet" href="static/febs/css/eleTree.css" media="all">
	<link rel="stylesheet" href="static/febs/css/apexcharts.min.css" media="all">
	<link rel="stylesheet" href="static/febs/css/formSelects-v4.css" media="all">

    <!-- Bootstrap -->
    <link href="static/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="static/css/content.css" rel="stylesheet">

    <script src="static/jquery-1.9.1.min.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>


<div class="layui-card " >
    <form class="form-inline" action="saveRoleAndPermissions" method="post">
    	<div class="layui-table">
			<div class="layui-card-header">添加新职位</div>
    		<div class="layui-card-body">
    			<div class="form-group">
                     <label >角色名称 </label>
                     <input type="text" class="form-control" id="roleName" name="name" >
                     <button type="submit" class="btn btn-primary">保存职位和权限</button>
                </div>
    		</div>
    	</div>
        <div class="panel panel-default">
            <div class="layui-inline">权限分配列表&nbsp;&nbsp;&nbsp;
            		<button type="button" class="layui-btn"  data-toggle="modal" data-target="#editModal">新建权限</button></div>
            <div class="layui-table">
                <table class="layui-table">
                    <thead>
	                    <tr >
	                        <th width="20%">主菜单</th>
	                        <th width="80%">子菜单和权限</th>
	                    </tr>
                    </thead>
                    <tbody>
						<c:forEach var="menu" items="${allPermissions}">
		                    <tr>
		                        <td>
		                        <input type="checkbox" name="permissionIds" value="${menu.id}"/>
		                        ${menu.name}</td>
		                        <td>
		                        	<c:forEach var="subPermission" items="${menu.children}">
		                        		<input type="checkbox" name="permissionIds" value="${subPermission.id}"/>
		                        		&nbsp;&nbsp;${subPermission.name} [${subPermission.type}]<br/>
		                        	</c:forEach>

		                        </td>
		                    </tr>
						</c:forEach>
                    </tbody>
                </table>
                
            </div>
        </div>
    </form>
    
</div>

	<!-- 编辑窗口 -->
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
	  <form id="permissionForm" action="saveSubmitPermission" method="post">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" onclick="doBack()" aria-hidden="true">×</button>
					<h3 id="myModalLabel">编辑权限</h3>
				</div>
				<div class="modal-body">
					<table class="table table-bordered table-striped" width="800px">
						<tr>
							<td>名称</td>
							<td><input class="form-control" name="name" placeholder="名称"></td>
						</tr>					
						<tr>
							<td>类型</td>
							<td>
							    <select class="form-control" name="type">
							    	<option value="menu">菜单</option>
							    	<option value="permission">权限</option>
							    	<option value="menu|permission">菜单|权限</option>
							    </select>
							</td>
						</tr>
						<tr>
						    <td>链接</td>
						    <td><input class="form-control" name="url" placeholder="链接">
						    </td>
						</tr>
						<tr>
							<td>权限标识</td>
							<td>
							   <input class="form-control" name="percode" placeholder="权限标识">
							</td>
						</tr>
						<tr>
						    <td>父节点</td>
						    <td>
						    	<select class="form-control" name="parentid">
						    		<option value="1">权限</option>
						    		<c:forEach var="menu" items="${menuTypes}">
						    			<option value="${menu.id}">${menu.name}</option>
						    		</c:forEach>
						    	</select>
						    </td>
						</tr>
						<tr>
						   <td>是否可用</td>
						   <td>
						   		<input type="checkbox" name="available" value="1"/>
						   </td>
						</tr>

					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal"
						aria-hidden="true" onclick="javascript:document.getElementById('permissionForm').submit()">保存</button>
					<button class="btn btn-default" data-dismiss="modal"
						aria-hidden="true">关闭</button>
				</div>
			</div>
		</div>
	  </form>
	</div>
	

</body>
</html>