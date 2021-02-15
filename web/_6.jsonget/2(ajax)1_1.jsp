<%--
  Created by IntelliJ IDEA.
  User: moonpeter
  Date: 2021/02/10
  Time: 5:03 오후
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
                $("table").remove();
                $("div").remove();

                $.ajax({
                    url : "item.json",
                    // url : "item_error.json",
                    dataType : "json",
                    success : function (rdata) {
                        if(rdata.length>0) {
                            var output = '<table><thead><tr><td>id</td><td>name</td>'
                            + ' <td>price</td><td>description</td></tr></thead><tbody>';
                            $(rdata).each(function (){
                                output += '<tr><td>' + this.id + '</td>'
                                + '<td>' + this.name + '</td>'
                                + '<td>' + this.price + '</td>'
                                + '<td>' + this.description + '</td></tr>';
                            });
                            output += '</tbody></table>'
                            $("button").after(output);
                        } else {
                            $("button").after("<div>요청한 데이터가 없습니다.</div>");
                        }
                    },
                    error : function (request, status, error) {
                        $("body").append("<div id='error'>code : "
                            + request.status + "<br>"
                            + "받은 데이터 : " + request.responseText + "<br>"
                            + "error status : " + status + "<br>"
                            + "error 메시지 : " + error + "</div>");
                    },
                    complete : function () {
                        $("body").append("<div id='com'>Ajax가 완료되었습니다.</div>");
                    }
                });
            });
        });
    </script>
</head>
<body>
<button>JSON 데이터를 불러옵니다. </button>
</body>
</html>
