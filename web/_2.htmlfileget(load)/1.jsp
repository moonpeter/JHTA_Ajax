<%--
  Created by IntelliJ IDEA.
  User: moonpeter
  Date: 2021/02/09
  Time: 3:33 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script>
        $(function (){
            $("button").click(function (){
                $("button").text('로딩완료').css('color', 'red');

                $("#container").load("resource1.html");
            });
        });
    </script>
</head>
<body>
<button>서버로부터 데이터 가져오기</button>
<div id="container">데이터 가져오기 전</div>
</body>
</html>
