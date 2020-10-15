<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/8/27
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>

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
<div class="layui-card " >
<div class="layui-card-body febs-table-full">
    <div class="layui-card-header">报销申请表</div>
    <table cellspacing="0" cellpadding="0" border="0" class="layui-table" lay-skin="line row">

        <thead>
        <tr>
            <th data-field="username" data-key="1-0-1" data-minwidth="100" class="">
                <div class="layui-table-cell laytable-cell-1-0-1"><span>任务ID</span></div></th>
            <th data-field="2" data-key="1-0-2" class=" layui-table-col-special">
                <div class="layui-table-cell laytable-cell-1-0-2"><span>任务名称</span></div></th>

            <th data-field="createTime" data-key="1-0-7" data-minwidth="180" class=" layui-unselect">
                <div class="layui-table-cell laytable-cell-1-0-7"><span>创建时间</span>

            <th data-field="6" data-key="1-0-6" class=" layui-table-col-special">
                <div class="layui-table-cell laytable-cell-1-0-6"><span>办理人</span></div></th>

            <th data-field="8" data-key="1-0-8" data-minwidth="140" class=" layui-table-col-special">
                <div class="layui-table-cell laytable-cell-1-0-8"><span>操作</span></div></th>
        </tr></thead>
                    <tbody>
                    <c:forEach var="task" items="${taskList}">
                        <tr>
                            <td>${task.id}</td>
                            <td>${task.name}</td>
                            <td>
                                <fmt:formatDate value="${task.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/>
                            </td>
                            <td>${task.assignee}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/viewTaskForm?taskId=${task.id}" class="btn btn-success btn-xs"><span class="glyphicon glyphicon-plus"></span> 办理任务</a>
<%--                                <a href="${pageContext.request.contextPath}/viewCurrentImage?taskId=${task.id}" target="_blank" class="btn btn-success btn-xs"><span class="glyphicon glyphicon-eye-open"></span> 查看当前流程图</a>--%>
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
