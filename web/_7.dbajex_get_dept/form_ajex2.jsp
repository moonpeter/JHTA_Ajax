<%--
  Created by IntelliJ IDEA.
  User: moonpeter
  Date: 2021/02/15
  Time: 9:29 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script>
        $(document).ready(function (){
            $("button").click(function (){
                $.ajax({
                    type : "post",
                    url : '${pageContext.request.contextPath}/dept_lib',
                    dataType : "json",
                    success : function (rdata) {
                        console.log("성공" + rdata)
                        $("button+div").remove()
                        if(rdata.length>0) {
                            var output = '<div id="result"><table class="table"><thead><tr><th>부서번호</th><th>부서명</th>'
                                + ' <th>지역</th></tr></thead><tbody>';
                            $(rdata).each(function (index, item){
                                output += '<tr>';
                                output += '<td>' + item.deptno + '</td>';
                                output += '<td>' + item.dname + '</td>';
                                output += '<td>' + item.loc + '</td>';
                                output += '</tr>';
                            });
                            output += '</tbody></table></div>'
                            $(".container").append(output);
                        } else {
                            $(".container").append('<div>요청한 데이터가 없습니다.</div>');
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
            })
        })
    </script>
</head>
<body>
    <div class="container">
        <button>데이터</button>
    </div>
</body>
</html>
