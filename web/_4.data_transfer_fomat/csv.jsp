<%--
  Created by IntelliJ IDEA.
  User: moonpeter
  Date: 2021/02/10
  Time: 9:27 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script>
        var input = '';
        input += '홍 길동, 서울시, 25세\n';
        input += '신사임당, 울산시, 45세';

        var inputs = input.split("\n");

        for (var i=0; inputs.length; i++) {
            var result = inputs[i].split(',');
            for(var j=0; j<result.length; j++){
                console.log(result[j].trim());
            }
        }

    </script>
</head>
<body>
<button>전송</button>
<div></div>
</body>
</html>
