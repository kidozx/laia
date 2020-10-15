<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 2020/8/26
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
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
<div  id="hua">
<div class="layui-layout layui-layout-admin" id="febs-layout">
    <div class="layui-header layui-anim febs-anim-down" id="app-header">

            <ul class="layui-nav layui-layout-left" lay-filter="febs-header">
                <li class="layui-nav-item" id="dong" lay-unselect>
                    <a febs-event="flexible" title="侧边伸缩">
                        <i  class="layui-icon layui-icon-shrink-right" ></i>
                    </a>
                </li>
                <span class="febs-breadcrumb"></span>
            </ul>
            <ul class="layui-nav layui-layout-right" lay-filter="febs-header">
                <li class="layui-nav-item layui-hide-xs" id="fullscreen" lay-unselect>
                    <a title="切换全屏">
                        <i class="layui-icon layui-icon-screen-full"></i>
                    </a>
                </li>

                <li class="layui-nav-item layui-user" lay-unselect>
                    <a>
                        <img style="width: 1.9rem;margin-right:.5rem;border-radius: 50%"
                             src="static/febs/images/avatar/default.jpg" title="头像">
                        ${activeUser.username}
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a class="layui-nav-child-href" id="user-profile">个人中心</a></dd>
                        <dd><a class="layui-nav-child-href" id="password-update">密码修改</a></dd>
                        <hr/>
                        <dd><a class="layui-nav-child-href" href="logout">退出登录</a></dd>
                    </dl>
                </li>
            </ul>

    </div>

    <div class="febs-tabs-hidden">
        <script type="text/html" id="TPL-app-tabsmenu" template>
            {{# if(layui.conf.viewTabs){ }}
            <div class="febs-tabs-wrap">
          <span class="febs-tabs-btn febs-tabs-action febs-tabs-prev" data-type="prev">
              <i class="layui-icon layui-icon-left"></i>
          </span>
                <span class="febs-tabs-btn febs-tabs-action febs-tabs-next" data-type="next">
              <i class="layui-icon layui-icon-right"></i>
          </span>
                <span class="febs-tabs-btn febs-tabs-action febs-tabs-down" data-type="down">
              <i class="layui-icon layui-icon-close"></i>
          </span>
                <ul class="febs-tabs-menu">
                    {{# layui.each(layui.view.tab.data,function(i, item){ }}
                    <li data-type="page" class="febs-tabs-btn" lay-url="{{item.fileurl}}">
                       <i class="febs-tabs-ball"></i>{{ item.title }}<b class="layui-icon layui-icon-close febs-tabs-close"></b>

                    </li>
                    {{# }) }}
                </ul>
            </div>
            {{# } }}
        </script>
    </div>

    <!-- 侧边菜单 -->
    <div class="layui-side febs-theme-white" id="app-sidebar" >
        <div class="layui-side-scroll">
            <div class="layui-logo" style="cursor: pointer">
                <img src="static/febs/images/logo.png">
                <span>FEBS 管理系统</span>
            </div>

    <ul class="layui-nav layui-nav-tree febs-theme-white"  lay-filter="test">
        <li class="layui-nav-item ">
                 <a lay-href target="报销管理" >
                     <i class="layui-icon layui-icon-gift"></i>报销管理</a>

                 <dl class="layui-nav-child " >
                     <dd class="layui-this" >
                         <a style="padding-left:50px" target="myindex" href="apply_baoxiao.jsp"  >报销申请</a>
                     </dd>
                     <dd class="layui-this" >
                         <a style="padding-left:50px" target="myindex" href="myBaoxiaoBill"  >我的报销单</a>
                     </dd>
                     <dd class="layui-this" >
                         <a style="padding-left:50px" target="myindex" href="myTaskList"  >我的代办事务</a>
                     </dd>

                 </dl>

        </li>
        <li class="layui-nav-item ">
                 <a lay-href target="任务管理" >
                     <i class="layui-icon layui-icon-time-circle"></i>任务管理</a>

                <dl class="layui-nav-child " >
                    <dd class="layui-this" >
                        <a style="padding-left:50px" target="myindex" href="add_process.jsp"  >发布流程</a>
                    </dd>
                    <dd class="layui-this" >
                        <a style="padding-left:50px" target="myindex" href="processDefinitionList"  >查看流程</a>
                    </dd>

                </dl>

        </li>
        <li class="layui-nav-item ">
            <a lay-href target="系统管理" >
                <i class="layui-icon layui-icon-setting"></i>系统管理</a>
            <dl class="layui-nav-child">
                <dd class="layui-this">
                    <a style="padding-left:50px" target="myindex" href="findUserList">用户管理</a>
                </dd>
                <dd>
                    <a style="padding-left:50px" target="myindex" href="toAddRole">职位管理</a>
                </dd>
                <dd>
                    <a style="padding-left:50px" target="myindex" href="findRoles">职位列表</a>
                </dd>
            </dl>
        </li>
         </ul>

        </div>
    </div>
    <!-- 主体内容 -->
    <div class="layui-body layui-fluid" id="febs-body" >

        <iframe class="layadmin-iframe ifrem_voice" src="index.jsp" width="100%" height="5000px" frameborder="0" name="myindex" scrolling="yes"></iframe>

    </div>
</div>

</div>
<script src="static/layui/layui.js"></script>


<script>

    layui.use(['jquery', 'element'], function () {
        var $ = layui.jquery,
            $view = $('#febs-layout')

        var element = layui.element;

        $view.on('click', '#fullscreen', function () {
            var $this = $(this);
            var normalCls = 'layui-icon-screen-full';
            var activeCls = 'layui-icon-screen-restore';
            var ico = $this.find('.layui-icon');

            if (ico.hasClass(normalCls)) {
                var a = document.body;
                a.webkitRequestFullScreen
                    ? a.webkitRequestFullScreen()
                    : a.mozRequestFullScreen
                    ? a.mozRequestFullScreen()
                    : a.requestFullScreen && a.requestFullscreen();
                ico.removeClass(normalCls).addClass(activeCls)
            } else {
                var b = document;
                b.webkitCancelFullScreen
                    ? b.webkitCancelFullScreen()
                    : b.mozCancelFullScreen
                    ? b.mozCancelFullScreen()
                    : b.cancelFullScreen
                        ? b.cancelFullScreen()
                        : b.exitFullscreen && b.exitFullscreen();
                ico.removeClass(activeCls).addClass(normalCls)
            }
        });

        var Show = $('#hua');
        $('#dong').click(function() {
            if(Show.hasClass(('febs-sidebar-shrink'))){
                Show.removeClass('febs-sidebar-shrink')
            }
            else
            {
                Show.addClass('febs-sidebar-shrink')
            }
        });


    });


</script>

