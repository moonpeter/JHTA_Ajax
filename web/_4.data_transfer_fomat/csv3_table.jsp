<%--
  Created by IntelliJ IDEA.
  User: moonpeter
  Date: 2021/02/10
  Time: 2:02 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <style>
        td {
            border: 1px solid gray;
        }
    </style>
    <script>
        $(function () {
            $("button").click(function () {
                $.get("data.csv", function (input) {
                    var inputs = input.split("\n");
                    var output = "<table><tr><td>이름</td><td>지역</td><td>나이</td></tr>"

                    for (var i = 0; i < inputs.length; i++) {
                        var result = inputs[i].split(',');
                        output += "<tr>";
                        for (var j = 0; j < result.length; j++) {
                            output += "<td>" + result[j].trim() + "</td>";
                        }
                        output += "</tr>"
                    }
                    output += "</table>"
                    $("div").html(output);
                });
            });
        });
    </script>
</head>
<body>
<button>데이터 불러오기</button>
<div>변경 전</div>
</body>
</html>
