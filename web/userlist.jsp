<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>FEBS 权限系统</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport"
		  content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="static/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="static/febs/css/febs.css" media="all">
	<link rel="stylesheet" href="static/febs/css/eleTree.css" media="all">
	<link rel="stylesheet" href="static/febs/css/apexcharts.min.css" media="all">
	<link rel="stylesheet" href="static/febs/css/formSelects-v4.css" media="all">

	<script src="static/jquery-1.9.1.min.js"></script>
	<script src="static/bootstrap/js/bootstrap.js"></script>


	<!-- Bootstrap -->
	<link href="static/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="static/css/content.css" rel="stylesheet">



</head>
<body>


<div class="layui-card " >
	<div class="layui-card-body layui-row" >
		<div class="layui-card-header">用户列表&nbsp;&nbsp;&nbsp;
			<button type="button" class="layui-btn layui-btn-normal"data-toggle="modal" data-target="#createUserModal" >添加员工</button></div>
		<form class="form-inline">
				<div class="table-responsive">
					<table cellspacing="0" cellpadding="0" border="0" class="layui-table" lay-skin="line row">
						<thead>
						<tr>
							<th width="5%">ID</th>
							<th width="10%">帐号</th>
							<th width="20%">电子邮箱</th>
							<th width="15%">角色分配</th>
							<th width="15%">上级主管</th>
							<th width="25%">操作</th>
						</tr>
						</thead>
			<tbody>
			<c:forEach var="user" items="${userList}">
				<tr>
					<td>${user.id}</td>
					<td>${user.name}</td>
					<td>${user.email}</td>
					<td>
						<select  onchange="assignRole(this.value,'${user.name}')">
							<c:forEach var="role" items="${allRoles}">
								<option value="${role.id}" <c:if test="${role.name==user.rolename}">selected</c:if>>${role.name}</option>
							</c:forEach>
						</select>
					</td>
					<td>
							${user.manager}
					</td>
					<td>
						<a href="#" onclick="viewPermission('${user.name}')" class="layui-btn layui-btn-success" data-toggle="modal" data-target="#editModal">
							<span class="layui-icon layui-icon-solution"></span> 查看权限</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
</div>
</form>
</div>
</div>


<!--添加用户 编辑窗口 -->
<div  class="modal fade" aria-labelledby="myModalLabel" aria-hidden="true" id="createUserModal">

	<div class="layui-card-body febs-table-full" >
		<form id="permissionForm" action="saveUser" method="post">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
						<h3 id="myModalLabel">添加员工</h3>
					</div>
					<div class="modal-body">
						<table class="table table-bordered table-striped" width="800px">
							<tr>
								<td>帐号</td>
								<td><input class="form-control" name="name" ></td>
							</tr>
							<tr>
								<td>初始密码</td>
								<td><input class="form-control" type="password" name="password" ></td>
							</tr>
							<tr>
								<td>电子邮箱</td>
								<td><input class="form-control" name="email" >
								</td>
							</tr>
							<tr>
								<td>职位</td>
								<td>
									<select class="form-control" name="role" onchange="getNextManager(this.value)">
										<option value="1">一般社畜</option>
										<option value="2">部门经理</option>
										<option value="3">网管</option>
										<option value="4">财务</option>
										<option value="5">会计部主管</option>
										<option value="6">总经理</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>上级主管</td>
								<td>
									<select  id="selManager" class="form-control" name="managerId"></select>
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

</div>
<!-- 查看用户角色权限窗口 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" >
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="myModalLabel">权限列表</h3>
			</div>
			<div class="modal-body" id="roleList">
				<table class="table table-bordered"  width="800px">
					<thead>
					<tr>
						<th>角色</td>
						<th>权限</th>
					</tr>
					</thead>
					<tbody id="roleListBody">
					</tbody>
				</table>
			</div>
			<div class="modal-footer">
				<button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
			</div>
		</div>
	</div>
	<script src="static/layui/layui.js"></script>
	<script type="text/javascript">

		//查看当前员工的角色和权限列表
		function viewPermission(user_name) {
			$.ajax({
				url:'viewPermissionByUser',
				type:'post',
				data:{
					userName:user_name
				},
				dataType:'json',
				success:function(sysRole) {
					//先清空原来的内容
					$("#roleListBody").empty();

					var role_td = "<td>" + sysRole.name+"</td>";
					var permission_td = "<td>";
					var permission_list = sysRole.permissionList;
					$.each(permission_list,function(i,perm){
						permission_td += perm.name + "【" + perm.type + "】 <br/>"
					});
					permission_td += "</td>";

					var roleRow = $("<tr>"+role_td+permission_td+"</tr>");
					$("#roleListBody").append($(roleRow));
				},
				error:function(req,error) {
					alert(req.status+':'+error);
				}
			});
		}

		//重新分配待办人
		function assignRole(rid,uname) {
			var url = "assignRole";
			var params = {
				roleId:rid,
				userId:uname
			};
			$.getJSON(url,params,function(result){
				alert(result.msg);
				role = rid;
			});
		}

		//根据员工级别查找下一级别主管
		function getNextManager(levelNo) {
			var url = "findNextManager";
			console.log(levelNo)
			var params = {
				level:levelNo
			};
			$.getJSON(url,params,function(managerList){
				$("#selManager").empty();
				$.each(managerList,function(i,manager){
					var opt = $("<option value='"+manager.id+"'>"+manager.name+"</option>");
					$("#selManager").append($(opt));
				});
			});
		}

	</script>
</div>
</body>
</html>