<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/6/2
  Time: 15:29
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
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
    </style>
</head>
<body>
    <div style="width:400px;height:270px; margin:auto;position:absolute;top:0;bottom:0;left:0;right:0;border:1px solid black;background-color:#87CEEB;">
        <div style="position:absolute;width:400px;height:50px;font-size:30px;background-color:#00BFFF;text-align:center">用&nbsp;&nbsp;&nbsp;&nbsp;户&nbsp;&nbsp;&nbsp;&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录</div>
        <div style="position:absolute;left:10px;top:70px;width:100px;height:30px;font-size:25px;">account</div>
        <div style="position:absolute;left:10px;top:120px;width:100px;height:30px;font-size:25px;">password</div>
        <form method="get" action="${pageContext.request.contextPath}/user/login">
            <input type="text" name="account" id="account" style="position:absolute;left:140px;top:70px;width:200px;height:30px;font-size:20px;"><br/>
            <input type="password" name="password" id="password" style="position:absolute;left:140px;top:120px;width:200px;height:30px;font-size:20px;"><br/>
            <input type="submit" value="登    录" style="position:absolute;left:70px;top:170px;width:260px;height:50px;font-size:30px;background-color:#3CB371;">
            <a href="${pageContext.request.contextPath}/user/toAddUser" style="text-decoration:none; position:absolute;left:0px;top:245px;background-color:#87CEEB;border:1px solid">注册新用户 </a>
            <input type="button" value="忘记密码" style="position:absolute;left:320px;top:245px;background-color:#87CEEB;border:none">
        </form>
    </div>
</body>
</html>
