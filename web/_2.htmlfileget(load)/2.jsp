<%--
  Created by IntelliJ IDEA.
  User: moonpeter
  Date: 2021/02/09
  Time: 4:27 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <style>
        div {
            width: 180px;
            height: 80px;
            margin: 3px;
            float: left;
        }
    </style>
    <script>
        $(function (){
            $("#menu1").click(function (){
                $("#message1").load("menu.html");
            });
            $("#menu2").click(function (){
                $("#message2").load("menu.html li");
            });
        });
    </script>
</head>
<body>
<div>
    <a href="#" id="menu1">메뉴 보기 1</a>
    <p>
        <span id="message1"></span>
    </p>
</div>
<div>
    <a href="#" id="menu2">메뉴 보기 2</a>
    <p>
        <span id="message2"></span>
    </p>
</div>
</body>
</html>
