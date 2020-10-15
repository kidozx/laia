<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<head>
    <title>FEBS 管理系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="static/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="static/febs/css/febs.css" media="all">
    <link rel="stylesheet" href="static/febs/css/login.css" media="all">
    <link rel="icon" href="static/images/favicon.ico" type="image/x-icon"/>
</head>
<body>
<div id="febs-login" lay-title="登录">
    <div class="login-wrap">
        <div class="layui-container">
            <div class="layui-row">
                <div class="layui-col-xs12 layui-col-lg4 layui-col-lg-offset4 febs-tc">
                    <div class="layui-logo"><span><b>FEBS</b> 管理系统</span></div>
                </div>
                <div class="layui-col-xs12 layui-col-lg4 layui-col-lg-offset4" id="login-div">
                    <form action="" method="post">
                    <div class="layui-form" lay-filter="login-form">
                        <c:if test="${errorMsg != null}">
                            <p style="color: red">${errorMsg}</p>
                        </c:if>
                        <div class="layui-anim layui-anim-upbit">
                            <ul class="login-type-tab">
                                <li class="active">系统登录</li>
                            </ul>
                            <div class="normal-login-form">
                                <div class="layui-form-item">
                                    <label class="layui-icon label-icon layui-icon-username"></label>
                                    <input type="text" name="username" lay-verify="required"
                                           placeholder="用户名" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-form-item password-block">
                                    <label class="layui-icon label-icon layui-icon-password"></label>
                                    <input type="password" name="password" lay-verify="required"
                                           placeholder="密码" autocomplete="off" class="layui-input">
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-row">
                                        <div class="layui-col-xs7">
                                            <label class="layui-icon label-icon layui-icon-vercode"></label>
                                            <input type="text" maxlength="4" name="verifyCode" lay-verify="required"
                                                   placeholder="验证码" class="layui-input" autocomplete="off">
                                        </div>
                                        <div class="layui-col-xs5">
                                            <img class="codeimg" id="codeimg"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <button class="layui-btn layui-btn-normal layui-btn-fluid" lay-submit
                                            lay-filter="login-submit" id="login">
                                        <i style="display: none"
                                           class="layui-icon layui-icon-loading layui-icon layui-anim layui-anim-rotate layui-anim-loop"></i>
                                        立即登录
                                    </button>
                                </div>
                            </div>
                            <div class="layui-form-item febs-tr">
                                <a id="regist-href">注册账号</a>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>

<%--                <div class="layui-col-xs12 layui-col-lg4 layui-col-lg-offset4 febs-hide" id="regist-div">--%>
<%--                    <div class="layui-form" lay-filter="regist-form">--%>
<%--                        <div class="layui-anim layui-anim-upbit">--%>
<%--                            <ul class="login-type-tab">--%>
<%--                                <li class="active">账号注册</li>--%>
<%--                            </ul>--%>
<%--                            <div class="normal-login-form">--%>
<%--                                <div class="layui-form-item">--%>
<%--                                    <label class="layui-icon label-icon layui-icon-username"></label>--%>
<%--                                    <input type="text" name="username" minlength="2" maxlength="10" lay-verify="range"--%>
<%--                                           placeholder="用户名" autocomplete="off" class="layui-input">--%>
<%--                                </div>--%>
<%--                                <div class="layui-form-item password-block">--%>
<%--                                    <label class="layui-icon label-icon layui-icon-password"></label>--%>
<%--                                    <input type="password" name="password" minlength="6" lay-verify="range"--%>
<%--                                           placeholder="密码" autocomplete="off" class="layui-input">--%>
<%--                                </div>--%>
<%--                                <div class="layui-form-item password-block">--%>
<%--                                    <label class="layui-icon label-icon layui-icon-password"></label>--%>
<%--                                    <input type="password" name="passwordB" lay-verify="required"--%>
<%--                                           placeholder="密码确认" autocomplete="off" class="layui-input">--%>
<%--                                </div>--%>
<%--                                <div class="layui-form-item">--%>
<%--                                    <button class="layui-btn layui-btn-normal layui-btn-fluid" lay-submit--%>
<%--                                            lay-filter="regist-submit" id="regist">--%>
<%--                                        <i style="display: none"--%>
<%--                                           class="layui-icon layui-icon-loading layui-icon layui-anim layui-anim-rotate layui-anim-loop"></i>--%>
<%--                                        立即注册--%>
<%--                                    </button>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="layui-form-item febs-tr">--%>
<%--                            <a id="login-href">已有账号？马上登录</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<script src="static/layui/layui.js"></script>
<script inline="javascript">
    // var ctx = [[@{/}]];
    //
    //     layui.extend({
    //     }).use(['form', 'layer', 'validate'], function (form, layer) {
    //         var $ = layui.jquery,
    //             validate = layui.validate,
    //             $view = $('#febs-login'),
    //             type = 'login',
    //             $loginDiv = $view.find('#login-div'),
    //             $registDiv = $view.find('#regist-div');
    //
    //         form.verify(validate);
    //         form.render();
    //         initCode();
    //
    //         //提交登录表单
    //         form.on('submit(login-submit)', function (data) {
    //             var loading = $(this).find('.layui-icon');
    //             if (loading.is(":visible")) return;
    //             loading.show();
    //             $.post(ctx + 'login', data.field, function (r) {
    //                 if (r.code === 200) {
    //                     location.href = ctx + 'index';
    //                 } else {
    //                     layer.msg(r.message);
    //                     loading.hide();
    //                     initCode();
    //                 }
    //             });
    //             return false;
    //         });
    //
    //         //提交注册表单
    //         form.on('submit(regist-submit)', function (data) {
    //             if (data.field.password !== data.field.passwordB) {
    //                 layer.msg('两次密码输入不一致！');
    //                 return;
    //             }
    //             var loading = $(this).find('.layui-icon');
    //             if (loading.is(":visible")) return;
    //             loading.show();
    //             $.post(ctx + 'regist', data.field, function (r) {
    //                 if (r.code === 200) {
    //                     layer.msg('注册成功，请登录');
    //                     loading.hide();
    //                     $view.find('#login-href').trigger('click');
    //                 } else {
    //                     layer.msg(r.message);
    //                     loading.hide();
    //                 }
    //             });
    //             return false;
    //         });
    //
    //         function initCode() {
    //             $view.find('#codeimg').attr("src", ctx + "images/captcha?data=" + new Date().getTime());
    //         }
    //
    //         $view.find('#codeimg').on('click', function () {
    //             initCode();
    //         });
    //
    //         $view.find('#regist-href').on('click', function () {
    //             resetForm();
    //             type = 'regist';
    //             $loginDiv.hide();
    //             $registDiv.show();
    //         });
    //
    //         $view.find('#login-href').on('click', function () {
    //             resetForm();
    //             type = 'login';
    //             $loginDiv.show();
    //             $registDiv.hide();
    //         });
    //
    //         function resetForm() {
    //             $registDiv.find('input[name="username"]').val('')
    //                 .end().find('input[name="password"]').val('')
    //                 .end().find('input[name="passwordB"]').val('');
    //
    //             $loginDiv.find('input[name="username"]').val('')
    //                 .end().find('input[name="password"]').val('')
    //                 .end().find('input[name="verifyCode"]').val('');
    //         }
    //
    //         $(document).on('keydown', function (e) {
    //             if (e.keyCode === 13) {
    //                 if (type === 'login')
    //                     $view.find('#login').trigger("click");
    //                 if (type === 'regist')
    //                     $view.find('#regist').trigger("click");
    //             }
    //         });
    //     });
</script>

</body>
</html>