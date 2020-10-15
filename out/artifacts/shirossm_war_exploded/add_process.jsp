<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</head>
<body>

<!--路径导航-->
<%--<ol class="breadcrumb breadcrumb_nav">--%>
<%--    <li>首页</li>--%>
<%--    <li>流程管理</li>--%>
<%--    <li class="active">发布流程</li>--%>
<%--</ol>--%>
<!--路径导航-->

<div class="layui-fluid">
    <div class="layui-card " >
        <div class="layui-card-header">发布流程定义</div>
        <div class="layui-card-body ">
            <form action="${pageContext.request.contextPath}/deployProcess" enctype="multipart/form-data" method="post">
                <div class="layui-fluid">
                    <div class="layui-row">
                        <div class="layui-col-md12">

                            <div class="layui-form">
                                <label >流程名称 </label>
                                <input type="text" class="form-control" id="processName" name="processName" placeholder="">
                            </div>
                            <div class="form-group">
                                <label >选择文件</label>
                                <input type="file"  id="fileName" name="fileName"/>
                            </div>
                            <button type="submit" class="layui-btn layui-btn-warm" >部署流程</button>
<hr class="layui-bg-green"/>
                        </div>
                        <fieldset class="layui-elem-field">
                            <legend>说明</legend>
                            <div class="layui-field-box">
                                只支持压缩文件
                            </div>
                        </fieldset>
                </div>
                </div>
            </form>
        </div>

    </div>

</div>

<script src="static/layui/layui.js"/>

</body>
</html>