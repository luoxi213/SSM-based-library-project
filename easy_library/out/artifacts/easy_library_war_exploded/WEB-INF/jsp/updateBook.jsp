<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/26
  Time: 15:26
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>更新书籍信息</title>
    <style type="text/css">
        *{
            margin: 0;
            padding: 0;
        }
        html,body{
            width: 100%;
            height: 100%;
        }
        body{
            background-image: url("${pageContext.request.contextPath}/images/bookInfo.jpg");
            background-size: 100% 100%;
            width: 100%;
            height: 100%;
            background-repeat: no-repeat;
            position: absolute;
        }
        input{
            border: #f531ed 1px solid;
            padding-left: 1px;
            width: 300px;
            left:60px;
            position: absolute;
        }
        .input1{
            height: 50px;
            width: 50px;
            left: 350px;
            bottom: 0px;
            margin: 0;
        }
        .input2{
            border: #f531ed 1px solid;
            padding-left: 1px;
            width: 300px;
            height: 150px;
            left:60px;
            position: absolute;
        }
        form{
            height: 100%;
            width: 100%;
            box-sizing: border-box;
            padding-top:15px;
        }
        .p1{
            width: 400px;
            height: 300px;
            left: 38%;
            top: 5%;
            background-color: #ffffff;
            position: relative;
        }
        .text1{
            font-size: 20px;
            color: blueviolet;
            position: absolute;
            top: 0px;
            display: inline-block;
        }
        .p1 div{
            width:400px;
            height: 30px;
            position: relative;
            margin-bottom:10px ;
        }
        .div1{
            height: 50px;
        }
    </style>
</head>
<body>
    <div class="p1">
        <form action="${pageContext.request.contextPath}/book/updateBook" method="post" onsubmit="return checkValue()">
            <input id="bookid" name="bookid" value="${bookid}" type="hidden"/>
            <div>
                <a class="text1"> 名字：</a>
                <input  type="text" name="bookname" id="bookname" placeholder="新的书名" >
            </div>

            <div>
                <a class="text1"> 数量：</a>
                <input  type="number" name="bookcount", id="bookcount" placeholder="新的数量" >
            </div>

            <div class="div1">
                <a class="text1"> 描述：</a>
                <textarea class="input2" type="text" name="detail" id="detail" placeholder="新的描述" ></textarea>
            </div>

            <input class="input1" type="submit" value="修改" >
        </form>
        <jsp:include page="returnIndex.jsp" />
    </div>

    <%-- 判断更新时是否至少输入了一条新的信息 --%>
    <script>
        function checkValue() {
            var str = document.getElementById("bookname").value;
            if (str.length == 0){
                str = document.getElementById("bookcount").value;
                if (str.length == 0){
                    str = document.getElementById("detail").value;
                    if (str.length == 0){
                        alert("请输入至少一项信息");
                        return false;
                    }
                }
            }
            return true;
        }
    </script>
</body>
</body>
</html>
