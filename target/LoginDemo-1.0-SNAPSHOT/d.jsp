<%-- 
    Document   : d
    Created on : 2023年12月15日, 下午4:43:20
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>到底是從b or c哪邊來的?</h1>
        <%= request.getHeader("Referer")%>
                
    </body>
</html>
