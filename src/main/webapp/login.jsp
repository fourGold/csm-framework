<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>登入</title>
    <jsp:include page="import.jsp" flush="true"/>
    <script>
        if(top != self){
            top.location.href = location.href;
        }
        $(function () {
            $("#loginname").focus();

            //登入按钮提交
            $('#loginForm').submit(function (e) {
                e.preventDefault();
                $('#btnSubmit').button('loading');
                $('#loginForm').serialize();
                $('#loginForm').ajaxSubmit({
                    type: 'post',
                    url: "<c:url value='/login/login.do'/>",
                    success: function (data) {
                        if (data == 2) {
                            $('#divInfo').addClass("alert-danger").text('用户名或密码错误!');
                            $("#loginname").focus();
                            $('#btnSubmit').button('reset');
                        } else {
                            location.href = "<c:url value='/'/>";
                        }
                    },
                    error: function () {
                        $('#divInfo').addClass("alert-danger").text('登入失败!');
                        $('#btnSubmit').button('reset');
                    }
                });
            });
        });


    </script>
</head>

<body>
<div class="ch-container">
    <div class="row">

        <div class="row">
            <div class="col-md-12 center login-header">
                <h2>欢迎登入系统</h2>
            </div>
            <!--/span-->
        </div>
        <!--/row-->

        <div class="row">
            <div class="well col-md-5 center login-box">
                <div id="divInfo" class="alert alert-info">
                    请输入您的用户名和密码.
                </div>
                <form id="loginForm" class="form-horizontal">
                    <fieldset>
                        <div class="input-group input-group-lg">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user red"></i></span>
                            <input id="loginname" name="loginname" type="text" class="form-control" placeholder="用户名"
                                   required/>
                        </div>
                        <div class="clearfix"></div>
                        <br>

                        <div class="input-group input-group-lg">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock red"></i></span>
                            <input name="password" type="password" class="form-control" placeholder="密码" required/>
                        </div>
                        <div class="clearfix"></div>

                        <div class="input-prepend">
                            <label class="remember" for="remember"><input type="checkbox" id="remember">记住我</label>
                        </div>
                        <div class="clearfix"></div>

                        <p class="center col-md-5">
                            <button type="submit" id="btnSubmit" class="btn btn-primary" data-loading-text="登入中...">登入</button>
                        </p>
                    </fieldset>
                </form>
            </div>
            <!--/span-->
        </div>
        <!--/row-->
    </div>
    <!--/fluid-row-->

</div>
<!--/.fluid-container-->
<jsp:include page="externalJS.jsp" flush="true"/>
</body>
</html>