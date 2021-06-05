<%@ page import="com.ssm.pojo.User" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/25
  Time: 10:15
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
  <head>
    <meta charset="UTF-8">
    <title>welcome to library</title>
    <style type="text/css">
      *{
        margin: 0;
        padding: 0;
      }
      html,body{
        width: 100%;
        height: 100%;
      }
      p{
        font-family: STHUp;
        clear: both;
        text-align: center;
        font-size: 40px;
        font-weight: bold;
        color: darkorange;
      }
      button{
        margin-top: 150px;
        background-color: transparent;
      }
      .button1{
        float: left;
        margin-left: 33%;
      }
      .button2{
        float: right;
        margin-right: 33%;
      }
      a{
        text-decoration: none;
      }
      .a1{
        color: aquamarine;
      }
      .a2{
        color: darkorchid;
      }
      body{
        background-image: url("${pageContext.request.contextPath}/images/library.jpg");
        background-size: 100% 100%;
        width: 100%;
        height: 100%;
        background-repeat: no-repeat;
      }
    </style>
  </head>
  <body>
    <div>
      <%-- 先取出用户登录信息 --%>
      <%
        User user = (User) session.getAttribute("login");
        request.setAttribute("user", user);
      %>
      <%-- 登录提示 --%>
      <% if (user == null){ %>
        <a href="${pageContext.request.contextPath}/user/toLogin" style="text-decoration:underline;"><p>请登录 </p></a>
      <% } else { %>
      <%-- 欢迎界面 --%>
        <p >你好, ${user.username} </p>
        <button style="float: left; left: calc(50% + 6rem); top: 20px; position:absolute; margin: 0"><a href="${pageContext.request.contextPath}/user/logout"> 退出登录</a> </button>
      <% } %>

      <%-- 任何人都可以查询图书信息 --%>
      <button class="button1">
        <a class="a1" href="${pageContext.request.contextPath}/book/listBooks"><h1>查询图书</h1></a>
      </button>

      <%-- 管理员才可以添加图书 --%>
      <% if(user != null && user.getPermission() == 1) { %>
        <button class="button2">
          <a class="a2" href="${pageContext.request.contextPath}/book/toAddBook"><h1>添加图书</h1></a>
        </button>
      <% } else if (user != null && user.getPermission() == 2) {%>
      <%-- 用户才有我的借阅 --%>
        <button class="button2">
          <a class="a2" href="${pageContext.request.contextPath}/user/listUserBooks?userid=${sessionScope.get("login").userid}"><h1>我的借阅</h1></a>
        </button>
      <% } %>
    </div>
  </body>
</html>
