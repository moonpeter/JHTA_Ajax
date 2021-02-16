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
            function selectData(m) {
                var senddata = $("#insert_form").serialize();
                $.ajax({
                    tyupe: m,
                    url: '${pageContext.request.contextPath}/servlet_gson.bo',
                    data: senddata,
                    dataType: 'json',
                    success : function (rdata) {
                        console.log("성공" + rdata)
                        $("form+div").remove()
                        if(rdata.length>0) {
                            var output = '<div id="result"><table class="table"><thead><tr><th>아이디</th><th>상품명</th>'
                                + ' <th>가격</th><th>메이커</th></tr></thead><tbody>';
                            $(rdata).each(function (index, item){
                                output += '<tr>';
                                output += '<td>' + item.id + '</td>';
                                output += '<td>' + item.name + '</td>';
                                output += '<td>' + item.price + '</td>';
                                output += '<td>' + item.maker + '</td>';
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
                });
            }

            selectData("get");

            $('#insert_form').submit(function (event) {
                selectData("post");

                event.preventDefault();
            });
        });
    </script>
</head>
<body>
    <div class="container">
        <form id="insert_form">
            <fieldset>
                <legend>데이터 추가</legend>
                <table class="table" style="width:50%">
                    <tr>
                        <th><label>상품명</label></th>
                        <td><input type="text" name="name" id="name" class="form-control" required></td>
                    </tr>
                    <tr>
                        <th><label>가격</label></th>
                        <td><input type="text" name="price" class="form-control" required id="price"></td>
                    </tr>
                    <tr>
                        <th><label>메이커</label></th>
                        <td><input type="text" name="maker" class="form-control" id="maker" required></td>
                    </tr>
                </table>
                <button type="submit" class="btn btn-primary">추가</button>
            </fieldset>
        </form>
    </div>
</body>
</html>
