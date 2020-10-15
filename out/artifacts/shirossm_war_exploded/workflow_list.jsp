<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE >
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

    <link rel="icon" href="static/febs/images/favicon.ico" type="image/x-icon"/>
</head>
<body>

<!--路径导航-->
<%--<ol class="breadcrumb breadcrumb_nav">--%>
<%--    <li>首页</li>--%>
<%--    <li>流程管理</li>--%>
<%--    <li class="active">查看流程</li>--%>
<%--</ol>--%>
<!--路径导航-->
<div class="layui-card " >
<div class="layui-card-body febs-table-full">
    <div class="layui-card-header">部署信息管理列表</div>
    <table cellspacing="0" cellpadding="0" border="0" class="layui-table" lay-skin="line row">

        <thead>
        <tr>
            <th data-field="username" data-key="1-0-1" data-minwidth="100" class="">
                <div class="layui-table-cell laytable-cell-1-0-1"><span>部署ID</span></div></th>
            <th data-field="2" data-key="1-0-2" class=" layui-table-col-special">
                <div class="layui-table-cell laytable-cell-1-0-2"><span>流程名称</span></div></th>

            <th data-field="createTime" data-key="1-0-7" data-minwidth="180" class=" layui-unselect">
                <div class="layui-table-cell laytable-cell-1-0-7"><span>发布时间</span>


            <th data-field="8" data-key="1-0-8" data-minwidth="140" class=" layui-table-col-special">
                <div class="layui-table-cell laytable-cell-1-0-8"><span>操作</span></div></th>
        </tr></thead>

                    <tbody>
					<c:forEach var="dep" items="${depList}">
	                    <tr>
	                        <td>${dep.id}</td>
	                        <td>${dep.name}</td>
	                        <td>
	                        	<fmt:formatDate value="${dep.deploymentTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
	                        </td>
	                        <td>
	                            <a href="delDeployment?deploymentId=${dep.id}" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> 删除</a>
	                        </td>
	                    </tr>
					</c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </form>

<div class="layui-card " >
<div class="layui-card-body febs-table-full">
    <table cellspacing="0" cellpadding="0" border="0" class="layui-table" lay-skin="line row">
        <div class="layui-card-header">流程定义信息列表</div>
        <thead>
        <tr>
            <th data-field="username" data-key="1-0-1" data-minwidth="100" class="">
                <div class="layui-table-cell laytable-cell-1-0-1"><span>ID</span></div></th>
            <th data-field="2" data-key="1-0-2" class=" layui-table-col-special">
                <div class="layui-table-cell laytable-cell-1-0-2"><span>名称</span></div></th>
            <th data-field="deptName" data-key="1-0-3" class="">
                <div class="layui-table-cell laytable-cell-1-0-3"><span>流程定义的KEY</span></div></th>
            <th data-field="mobile" data-key="1-0-4" data-minwidth="165" class="">
                <div class="layui-table-cell laytable-cell-1-0-4"><span>流程定义的版本</span></div></th>

            <th data-field="createTime" data-key="1-0-7" data-minwidth="180" class=" layui-unselect">
                <div class="layui-table-cell laytable-cell-1-0-7"><span>流程定义的规则文件名称</span>

            <th data-field="createTime" data-key="1-0-7" data-minwidth="180" class=" layui-unselect">
                <div class="layui-table-cell laytable-cell-1-0-7"><span>流程定义的规则图片名称</span>

            <th data-field="6" data-key="1-0-6" class=" layui-table-col-special">
                <div class="layui-table-cell laytable-cell-1-0-6"><span>部署ID</span></div></th>

            <th data-field="8" data-key="1-0-8" data-minwidth="140" class=" layui-table-col-special">
                <div class="layui-table-cell laytable-cell-1-0-8"><span>操作</span></div></th>
        </tr></thead>

                    <tbody>
					<c:forEach var="pd" items="${pdList}">
	                    <tr>
	                        <td>${pd.id}</td>
	                        <td>${pd.name}</td>
	                        <td>${pd.key}</td>
	                        <td>${pd.version}</td>
	                        <td>${pd.resourceName}</td>
	                        <td>${pd.diagramResourceName}</td>
	                        <td>${pd.deploymentId}</td>
	                        <td>
	                          <a target="_blank" href="viewImage?deploymentId=${pd.deploymentId}&imageName=${pd.diagramResourceName}" class="btn btn-success btn-xs"><span class="glyphicon glyphicon-eye-open"></span> 查看流程定义图</a>
	                        </td>
	                    </tr>
					</c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </form>

</div>
</body>
</html>