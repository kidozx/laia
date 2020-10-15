<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE>
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

    <script src="static/jquery-1.9.1.min.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<!--路径导航-->
<%--<ol class="breadcrumb breadcrumb_nav">--%>
<%--    <li>首页</li>--%>
<%--    <li>报销管理</li>--%>
<%--    <li class="active">我的报销单</li>--%>
<%--</ol>--%>
<!--路径导航-->
<div class="layui-card " >
<div class="layui-card-body febs-table-full">
    <table cellspacing="0" cellpadding="0" border="0" class="layui-table" lay-skin="line row">
        <div class="layui-card-header">我的报销单</div>
        <thead>
        <tr>
            <th data-field="username" data-key="1-0-1" data-minwidth="100" class="">
                <div class="layui-table-cell laytable-cell-1-0-1"><span>ID</span></div></th>
            <th data-field="2" data-key="1-0-2" class=" layui-table-col-special">
                <div class="layui-table-cell laytable-cell-1-0-2"><span>报销金额</span></div></th>
            <th data-field="deptName" data-key="1-0-3" class="">
                <div class="layui-table-cell laytable-cell-1-0-3"><span>标题</span></div></th>
            <th data-field="mobile" data-key="1-0-4" data-minwidth="165" class="">
                <div class="layui-table-cell laytable-cell-1-0-4"><span>备注</span></div></th>

            <th data-field="createTime" data-key="1-0-7" data-minwidth="180" class=" layui-unselect">
                <div class="layui-table-cell laytable-cell-1-0-7"><span>提交时间</span>

            <th data-field="6" data-key="1-0-6" class=" layui-table-col-special">
                <div class="layui-table-cell laytable-cell-1-0-6"><span>状态</span></div></th>

            <th data-field="8" data-key="1-0-8" data-minwidth="140" class=" layui-table-col-special">
                <div class="layui-table-cell laytable-cell-1-0-8"><span>操作</span></div></th>
        </tr></thead>
        <tbody>
        <c:forEach var="bill" items="${baoxiaoList}">
            <tr>
                <td>${bill.id}</td>
                <td>${bill.money}</td>
                <td>${bill.title}</td>
                <td>${bill.remark}</td>
                <td>
                    <fmt:formatDate value="${bill.creatdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </td>
                <td>
                    <c:if test="${bill.state==1}">
                    <p class="layui-card-body icon-body"> 审核中</p>
                    </c:if>
                    <c:if test="${bill.state==2}">
                        <p class="layui-card-body icon-body icon-active"> 审核完成</p>
                    </c:if>
                </td>
                <td>
                    <c:if test="${bill.state==1}">
                        <a href="${pageContext.request.contextPath }/viewHisComment?id=${bill.id}"
                           class="layui-btn layui-btn-normal"><span class="layui-icon layui-icon-info-circle"></span> 查看审核记录</a>
                        <a href="${pageContext.request.contextPath}/viewCurrentImageByBill?billId=${bill.id}" target="_blank"
                           class="layui-btn layui-btn-success"><span class="layui-icon layui-icon-location"></span> 查看当前流程图</a>
                    </c:if>
                    <c:if test="${bill.state==2}">
                        <a href="leaveBillAction_delete?id=${bill.id}"
                           class="layui-btn layui-btn-danger"><span class="layui-icon layui-icon-close-square"></span> 删除</a>
                        <a href="${pageContext.request.contextPath }/viewHisComment?id=${bill.id}"
                           class="layui-btn layui-btn-success"><span class="layui-icon layui-icon-info-circle"></span> 查看审核记录</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


</div>
</div>
</body>
</html>