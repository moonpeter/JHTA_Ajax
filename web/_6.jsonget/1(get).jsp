<%--
  Created by IntelliJ IDEA.
  User: moonpeter
  Date: 2021/02/10
  Time: 3:24 오후
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
                $.getJSON('item.json', function (data, textStatus) {
                    $("table").remove();

                    console.log("data="+data)
                    console.log("textStatus="+textStatus);
                    console.log("data.stringify()="+JSON.stringify(data))
                    if(data.length>0) {
                        var output = "<table><thead><tr><td>id</td><td>name</td>"
                        + "<td>price</td><td>description</td></tr></thead><tbody>";

                        for(var i=0; i<data.length; i++) {
                            output += "<tr>"
                            output += "<td>" + data[i].id + "</td>"
                            output += "<td>" + data[i].name + "</td>"
                            output += "<td>" + data[i].price + "</td>"
                            output += "<td>" + data[i].description + "</td>"
                            output += "</tr>"
                        }
                        output += "</tbody></table>"
                        $("body").append(output);
                    } else {
                        $("div").append("데이터가 없습니다.");
                    }

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
