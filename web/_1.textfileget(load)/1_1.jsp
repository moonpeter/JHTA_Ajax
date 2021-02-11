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

                $("p").load("sample1.txt");

                $("pre").load("sample1.txt");

            });
        });
    </script>
</head>
<body>
<button>변경</button>
<p>변경전 : 줄이 안바뀌어요</p>
<br>
<pre>변경전 : 줄이 바뀝니다.(입력한 대로 출력됩니다.)</pre>
</body>
</html>
