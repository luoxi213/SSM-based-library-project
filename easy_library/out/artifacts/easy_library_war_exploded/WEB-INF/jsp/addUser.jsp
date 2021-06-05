<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/2
  Time: 15:30
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>新用户注册</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        html {
            height: 100%;
            width: 100%;
            overflow: hidden;
            margin: 0;
            padding: 0;
            background: url("${pageContext.request.contextPath}/images/desert.png") no-repeat 0px 0px;
            background-repeat: no-repeat;
            background-size: 100% 100%;
            -moz-background-size: 100% 100%;
        }

        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100%;
        }

        #loginDiv {
            width: 37%;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 650px;
            background-color: rgba(75, 81, 95, 0.3);
            box-shadow: 7px 7px 17px rgba(52, 56, 66, 0.5);
            border-radius: 5px;
        }

        #name_trip {
            margin-left: 50px;
            color: red;
        }

        .sexDiv>input,
        .hobby>input {
            width: 30px;
            height: 17px;
        }

        input,
        select {
            margin-left: 15px;
            border-radius: 5px;
            border-style: hidden;
            height: 30px;
            width: 140px;
            background-color: rgba(216, 191, 216, 0.5);
            outline: none;
            color: #f0edf3;
            padding-left: 10px;
        }
        p {
            margin-top: 10px;
            margin-left: 20px;
            color: azure;
        }
        .button {
            border-color: cornsilk;
            background-color: rgba(100, 149, 237, .7);
            color: aliceblue;
            border-style: hidden;
            border-radius: 5px;
            width: 100px;
            height: 31px;
            font-size: 16px;
        }

        .introduce>textarea {
            background-color: rgba(216, 191, 216, 0.5);
            border-style: hidden;
            outline: none;
            border-radius: 5px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            margin-top: 20px;
            color: #f0edf3;
        }

        b {
            margin-left: 50px;
            color: #FFEB3B;
            font-size: 10px;
            font-weight: initial;
        }
    </style>
</head>

<body>
<div id="loginDiv">
    <form action="${pageContext.request.contextPath}/user/addUser" method="post" onsubmit="return checkForm()">
        <h1>注册</h1>
        <p>用户名&nbsp;&nbsp;&nbsp;&nbsp;<input id="username" name="username" type="text" autofocus required><label id="name_trip"></label></p>

        <p>账号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="account" name="account" type="text" required><label id="account_trip"></label></p>

        <p>密码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="password" name="password" type="password" required><label id="password_trip"></label></p>

        <p>确认密码<input id="surePassword" type="password" required><label id="surePassword_trip"></label></p>

        <%-- 隐藏框，默认提交权限为2，代表普通用户 --%>
        <p><input id="permission" name="permission" type="hidden" value="2"/>

        <br>
        <p style="text-align: center;">
            <input type="submit" class="button" value="提交">
            <input type="reset" class="button" value="重置">
        </p>
    </form>
</div>

</body>
<script>
    function checkForm() {

        //获取用户名输入项
        var username = document.getElementById("username").value;
        if (username.length < 1 || username.length > 10) {
            alert("用户名长度为1-10位!!");
            return false;
        }

        //获取账号输入项
        var account = document.getElementById("account").value;
        if (account.length < 1 || account.length > 10) {
            alert("账号长度为1-10位!!");
            return false;
        }

        //密码长度大于6小于20
        var password = document.getElementById("password").value;
        if (password.length < 6 || password.length > 20) {
            alert("密码长度为6-20位!!");
            return false;
        }

        //获取确认密码框的值 var
        var surePassword = document.getElementById("surePassword").value;
        if (password != surePassword) {
            alert("两次密码不一致");
            return false;
        }

        // 所有输入均合法
        return true;
    }

</script>
</html>
