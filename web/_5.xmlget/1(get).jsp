<%--
  Created by IntelliJ IDEA.
  User: moonpeter
  Date: 2021/02/10
  Time: 3:24 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<html>
<head>
    <title>Title</title>
    <style>
        td {
            border: 1px solid gray;
        }
    </style>
    <script>
        $(function () {
            $("button").click(function () {
                $.get("item.xml", function (input) {
                    $("table").remove();

                    var output = "<table><tr><td>id</td><td>name</td><td>price</td><td>description</td><tbody>"

                    $(input).find('item').each(function () {
                        output += "<tr>"
                            + "<td>" + $(this).attr("id") + "</td>"
                            + "<td>" + $(this).attr("name") + "</td>"
                            + "<td>" + $(this).find("price").text() + "</td>"
                            + "<td>" + $(this).find("description").text() + "</td>"
                            + "</tr>";
                    })
                    output += "</tbody></table>"
                    $("body").append(output);
                })
            })
        })
    </script>
</head>
<body>
<button>XML 형식으로 데이터를 가져옵니다.</button>
<div></div>
</body>
</html>
