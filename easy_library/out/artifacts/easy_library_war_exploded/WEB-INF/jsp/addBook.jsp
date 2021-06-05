<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/5/25
  Time: 20:52
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加图书</title>
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
        <form action="${pageContext.request.contextPath}/book/addBook" method="post" onsubmit="return checkValue()">
            <div>
                <a class="text1"> 名字：</a>
                <input  type="text" name="bookname" id="bookname" placeholder="请给书起个名吧" >
            </div>

            <div>
                <a class="text1"> 数量：</a>
                <input  type="number" name="bookcount", id="bookcount" placeholder="书的数量" >
            </div>

            <div class="div1">
                <a class="text1"> 描述：</a>
                <textarea class="input2" type="text" name="detail" id="detail" placeholder="请用几句话描述此书" ></textarea>
            </div>

            <input class="input1" type="submit" value="添加" >
        </form>
        <jsp:include page="returnIndex.jsp" />
    </div>

    <script>
        <%-- 用一个js函数判断有没有输入书名和数量，描述信息选填(但不能超过100字) --%>
        function checkValue() {
            var str = document.getElementById("bookname").value;
            if (str.length < 1 || str.length > 10){
                alert("书名为1-10字");
                document.getElementById("bookname").focus();
                return false;
            }
            str = document.getElementById("bookcount").value;
            if (str.length < 1){
                alert("请输入数量");
                document.getElementById("bookcount").focus();
                return false;
            }
            str = document.getElementById("detail").value;
            if (str.length > 100){
                alert("书籍描述不能超过100字");
                document.getElementById("detail").focus();
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
