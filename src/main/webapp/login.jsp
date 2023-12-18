<%-- 
    Document   : login
    Created on : 2023年12月15日, 上午9:19:10
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
        您目前的位置在<%=request.getRequestURI()%>
        <h1>會員登入</h1>
        <form action="checkpass.jsp">
            帳號:<input type="text" name="username" value="" /><br>
            密碼:<input type="password" name="passwrd" value="" /><br>
            <input type="submit" value="登入" />
            <input type="reset" value="清除" />
        </form>
    </body>
</html>
