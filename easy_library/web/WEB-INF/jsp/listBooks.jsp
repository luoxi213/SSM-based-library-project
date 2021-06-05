<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/25
  Time: 20:22
--%>
<%@ page import="com.ssm.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>图书列表</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <style type="text/css">
        html,body{
            width: 100%;
            height: 100%;
        }
        body{
            background-image: url("${pageContext.request.contextPath}/images/listBooks.jpg");
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            background-repeat: no-repeat;
        }
        table,th,td{
            border: 1px solid red ;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
    <%-- 先取出用户登录信息 --%>
    <%
        User user = (User) session.getAttribute("login");
        request.setAttribute("user", user);
    %>
    <div
    class="container" style="width: 630px; position:relative; left: 30%; top: 5%; background-color: white">
    <table class="tablelist">
        <thead>
        <tr>
            <th style="width: 50px; text-align: center">序号</th>
            <th style="width: 140px; text-align: center">书名</th>
            <th style="width: 50px; text-align: center">数量</th>
            <th style="width: 310px; text-align: center">描述</th>
            <th style="width: 100px;text-align: center">操作</th>
        </tr>
        </thead>
        <tbody>
        <%-- 先确定有书可展示 --%>
        <c:if test="${books != null}" >
            <c:forEach items="${books}" var="book" varStatus="st">
                <tr style="height: 35px">
                    <td align="center">${st.count}</td>
                    <td align="center">${book.bookname}</td>
                    <td align="center">${book.bookcount}</td>
                    <td align="center">${book.detail}</td>
                    <td align="center">
                        <%-- 对不登录、普通用户、管理员提供不同的操作 --%>
                        <% if (user == null) { %>
                            无操作
                        <% } else if (user.getPermission() == 2) { %>
                            <button onclick="borrowBook(${book.bookcount}, ${book.bookid}, ${user.userid})"><a class="btn btn-primary btn-xs">借书</a></button>
                        <% } else { %>
                            <button style="float: left"><a href="${pageContext.request.contextPath}/book/toUpdateBook/${book.bookid}" class="btn btn-primary btn-xs">修改</a></button>
                            <button style="float: right"><a href="${pageContext.request.contextPath}/book/delBook?bookid=${book.bookid}" class="btn btn-primary btn-xs">删除</a></button>
                        <% } %>
                    </td>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
    <jsp:include page="returnIndex.jsp" />
    </div>

    <script type="text/javascript">
        // 借书用ajax传递json格式信息
        function borrowBook(bookcount, bookid, userid) {
            if (bookcount == 0){
                alert("无书可借");
                return;
            }
            $.ajax({
                url:"${pageContext.request.contextPath}/book/borrowBook",
                type:"post",
                data:JSON.stringify({bookid:bookid, userid:userid}),
                contentType:"application/json;charset=UTF-8",
                success: function (data) {
                    // 显示后端返回的结果
                    alert(data.info);
                    // 刷新本页面
                    location.reload();
                }
            })
        }
    </script>
</body>
</html>
