<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/8/25
  Time: 19:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<%----%>
<style>
    #febs-index .welcome-info {
        border: 1px solid #f1f1f1;
        margin-bottom: .5rem;
        padding: .5rem;
    }

    #febs-index .welcome-info-wrapper {
        padding: .2rem;
        display: inline-block
    }

    #febs-index .welcome-info-wrapper .user-header {
        display: inline-block;
        vertical-align: middle
    }

    #febs-index .welcome-info-wrapper .user-header img {
        width: 5rem;
        margin: .5rem 1rem;
        border-radius: 50%
    }

    #febs-index .welcome-info-wrapper .user-info {
        display: inline-block;
        vertical-align: middle
    }

    #febs-index .welcome-info-wrapper .user-info .random-message {
        font-size: 1rem;
        margin-bottom: .2rem;
        max-width: 21rem
    }

    #febs-index .welcome-info-wrapper .user-info .user-dept, #febs-index .welcome-info-wrapper .user-info .user-login-info {
        color: rgba(0, 0, 0, 0.45);
    }

    #febs-index .login-count-table {
        width: 100%;
        margin: 1rem;
    }

    #febs-index .login-count-table .count {
        padding-top: .8rem;
        font-size: 1rem;
        font-weight: 600;
        color: #1890ff
    }

    #febs-index .project-table {
        padding: .5rem;
        border: 1px solid #f1f1f1;
        width: 100%
    }

    #febs-index .project-table-td {
        padding: .5rem 0.7rem;
        border: 1px solid #f1f1f1;
    }

    #febs-index .project-table-td a {
        color: #42b983;
        font-size: .9rem;
        font-weight: 600;
    }

    #febs-index .project-desc {
        color: rgba(0, 0, 0, 0.45);
    }
</style>
<div class="layui-fluid layui-anim febs-anim-up" id="febs-index" lay-title="系统首页">
    <div class="layui-row layui-col-space8 febs-container">
        <div class="layui-col-md12 layui-col-sm12 layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-body layui-anim layui-anim-fadein">
                    <div class="layui-row welcome-info">
                        <div class="layui-col-md6 layui-col-sm12 layui-col-xs12">
                            <div class="layui-row welcome-info-wrapper">
                                <div class="user-header">

                                    <img alt="头像" id="user-avatar" src="static/febs/images/avatar/default.jpg">
                                </div>
                                <div class="user-info">
                                    <div class="layui-row">

                                        <div class="user-dept">
                                            <span id="user-dept">${activeUser.username}</span> | ${dept} <span id="user-role"></span>
                                        </div>
                                        <div class="user-login-info">

                                            上次登录时间：<span id="shangci" ></span>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="layui-col-md6 layui-col-sm12 layui-col-xs12">
                            <div class="layui-col-md-offset5">
                                <table class="login-count-table">
                                    <tr>
                                            <span id="welcome-message" style="font-size: 18px"></span>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script data-th-inline="javascript" type="text/javascript">

    var hour = new Date().getHours();
    var time = hour < 6 ? '早上好' : (hour <= 11 ? '上午好' : (hour <= 13 ? '中午好' : (hour <= 18 ? '下午好' : '晚上好')));
    var welcomeArr = [
        '喝杯咖啡休息下吧☕',
        '要不要和朋友打局LOL',
        '今天又写了几个Bug呢',
        '今天在群里吹水了吗',
        '今天吃了什么好吃的呢',
        '今天被Bug折腾了吗',
        '准备吃些什么呢',
        '周末要不要去看电影？',
        '今天打算解决几个Bug呢？'
    ];
    var index = Math.floor((Math.random() * welcomeArr.length));
    var welcomeMessage = time + '，' + welcomeArr[index];
    document.getElementById('welcome-message').innerText=welcomeMessage;
    console.log( document.getElementById('welcome-message').innerText);


    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var year = date.getFullYear();
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = year + seperator1 + month + seperator1 + strDate;
        return currentdate;
    }

    var nowtime=getNowFormatDate();
    document.getElementById('shangci').innerText =nowtime;
</script>

