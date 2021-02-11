<%--
  Created by IntelliJ IDEA.
  User: moonpeter
  Date: 2021/02/09
  Time: 4:43 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script>
        $(function () {
            $("form").submit(function (e) {
                e.preventDefault();
                var data = {
                    name :$("#name").val(),
                    age : $("#age").val(),
                    address : $("#address").val()
                };
                $("div").load("process.jsp", data);
            });
        })
    </script>
</head>
<body>
<form method="post">
    <span>이름</span><input type="text" placeholder="이름" id="name" name="name" required>
    <span>나이</span><input type="text" placeholder="나이" id="age" name="age" required>
    <span>주소</span><input type="text" placeholder="주소" id="address" name="address" required>
    <input type="submit" value="전송">
</form>
<div></div>
</body>
</html>
