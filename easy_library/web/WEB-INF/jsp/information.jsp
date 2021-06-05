<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/26
  Time: 13:33
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>消息</title>
</head>
<body>
    <div style="text-align: center; font-size: 40px; color: deepskyblue">
        <h1>
            ${msg}
        </h1>
    </div>
    <div style="text-align: center">
        <form style="position: relative; width: 80px; height: 50px; left: 47%" action="${pageContext.request.contextPath}/index.jsp" >
            <input type="submit" value="确定" style="width: 100%; height: 100%">
        </form>
    </div>
</body>
</html>
