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
    <title>报销任务办理详情</title>
    <link rel="stylesheet" href="static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="static/febs/css/febs.css" media="all">
    <link rel="stylesheet" href="static/febs/css/eleTree.css" media="all">
    <link rel="stylesheet" href="static/febs/css/apexcharts.min.css" media="all">
    <link rel="stylesheet" href="static/febs/css/formSelects-v4.css" media="all">
    <!-- Bootstrap -->
    <link href="static/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="static/content.css" rel="stylesheet">

    <script src="static/jquery-1.9.1.min.js"></script>
    <script src="static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>



    <div class="layui-card layui-col-md8" >

        <div class="layui-card-header">报销申请表</div>
        <div class="layui-card-body febs-table-full ">
        <form action="saveStartBaoxiao" method="post">
                <div class="layui-col-md5" >
                    <label class="">标题</label>
                    <input type="text" name="title" placeholder="报销项目名" autocomplete="off" readonly="readonly" class="layui-input" value="${baoxiaoBill.title}">
                </div>
                <div class="layui-col-md4 layui-col-md-offset8">
                    <input type="hidden"/>
                </div>
                <div class="layui-col-md4" >
                    <label class="">金额</label>
                    <input type="text" name="money" placeholder="报销金额" autocomplete="off" readonly="readonly" class="layui-input" value="${baoxiaoBill.money}">
                </div>

                <div class="layui-col-md8 layui-col-md-offset4">
                    <input type="hidden"/>
                </div>

                <div class="layui-col-md6 " >
                    <label class="">申请事由</label>
                    <textarea name="remark" placeholder="请输入申请事由" readonly="readonly" class="layui-textarea" >${baoxiaoBill.remark}</textarea>
                </div>
                <div class="layui-col-md8 layui-col-md-offset4">
                    <input type="hidden"/>
                </div>
                <div class="layui-col-md6" style="margin-bottom:20px;">
                    <label class="">批注</label>
                    <textarea name="remark" placeholder="请输入批注" readonly="readonly" class="layui-textarea"></textarea>
                </div>
                <div class="layui-col-md8 layui-col-md-offset4">
                    <input type="hidden"/>
                </div>
                <div class="layui-col-md6" style="margin-bottom:20px;" >
                    <c:forEach var="outcome" items="${outcomeList}">
                        <input type="submit" name="outcome" class="layui-btn" value="${outcome}"/>
                    </c:forEach>
                </div>
                <input type="hidden" name="id" value="${baoxiaoBill.id}"/>
                <input type="hidden" name="taskId" value="${taskId}"/>

        </form>
    </div>
</div>
    <div class="layui-card layui-col-md7">
        <div  class="layui-col-md6 layui-col-md-offset6">
            <input type="hidden">
        </div>
        <div class="layui-card-header">报销批注信息列表</div>
        <div class="layui-card-body">
            <div class="layui-table">
                <c:if test="${fn:length(commentList)>0}">
                    <table class="layui-table" lay-skin="line row">
                        <thead>
                        <tr>
                            <th width="15%">时间</th>
                            <th width="10%">批注人</th>
                            <th width="75%">批注信息</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="comment" items="${commentList}">
                            <tr>
                                <td>
                                    <fmt:formatDate value="${comment.time}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </td>
                                <td>${comment.userId}</td>
                                <td>
                                        ${comment.fullMessage}
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
                <c:if test="${fn:length(commentList)==0}">
                    <table class="layui-table">
                        <tr>
                            <td>暂无批注信息</td>
                        </tr>
                    </table>
                </c:if>
            </div>
        </div>
    </div>


</body>
</html>