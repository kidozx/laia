<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/8/27
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
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

<div class="layui-fluid">
<div class="layui-card " >

    <div class="layui-card-header">报销申请表</div>
    <form action="saveStartBaoxiao" method="post">
    <div class="layui-card-body ">
        <div class="layui-col-md5" style="margin-bottom:20px;">
            <label class="">标题</label>
            <input type="text" name="title" placeholder="报销项目名" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-col-md4 layui-col-md-offset8">
        </div>
        <div class="layui-col-md4" style="margin-bottom:20px;">
            <label class="">金额</label>
            <input type="text" name="money" placeholder="报销金额" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-col-md8 layui-col-md-offset4">
            <input type="hidden">
        </div>
        <div class="layui-col-md6 " style="margin-bottom:20px;">
            <label class="">申请事由</label>
            <textarea name="remark" placeholder="请输入申请事由" class="layui-textarea"></textarea>
        </div>
    </div>

    <div class="layui-form-item" style="margin-bottom:20px;">
        <div class="layui-input-block">
            <button class="layui-btn" type="submit">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
        <div/>
</form>
        </div>
</div>

    </div>
<script src="static/layui/layui.js"/>
<script>
    layui.use('form', function () {
        var $ = layui.$,
            element = layui.element,
            layer = layui.layer,
            laydate = layui.laydate,
            form = layui.form;


        laydate.render({
            elem: '#febs-form-group-date'
        });


        /* 监听提交 */
        form.on('submit(febs-form-group-submit)', function (data) {
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            });
            return false;
        });
    });
</script>
</html>