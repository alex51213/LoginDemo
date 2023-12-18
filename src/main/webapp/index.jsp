<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%!
        //每一個連線預設都會分配一個session
        HttpSession session;
    %>
    <%
        session =request.getSession();
    %>
    <body>
        <h1>會員登入系統: session id:<%= session.getId()%></h1>
        瀏覽器版本<%= request.getHeader("User-Agent")%><br>
        瀏覽器語系<%= request.getHeader("Accept-Language")%><br>
       使用者IP: <%= request.getRemoteAddr()%><br>
        Tomcat IP:<%= request.getLocalAddr() %><br>
        您目前的位置在<%=request.getRequestURI()%><br>
        <a href="/LoginDemo/login.jsp">登入會員系統</a>
    </body>
</html>
