<%--
  Created by IntelliJ IDEA.
  User: moonpeter
  Date: 2021/02/09
  Time: 4:46 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

    <title>Title</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<p>넘어온 이름은 ${param.name} 입니다</p>
<p>넘어온 나이는 ${param.age}세 입니다.</p>
<p>넘어온 주소는 ${param.address} 입니다.</p>
</body>
</html>
