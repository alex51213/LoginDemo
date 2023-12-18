<%-- 
    Document   : page1
    Created on : 2023年12月15日, 上午9:24:12
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%!
        HttpSession session;
        String memberName;
    %>
    <%
        session =request.getSession();
        if(session.getAttribute("username")==null){
        //response.sendRedirect("/LoginDemo/login.jsp");
        response.sendRedirect("nologin.html");
        }
        else{
        memberName=session.getAttribute("username").toString();
        }
        
    %>
    <body>
        您目前的位置在<%=request.getRequestURI()%>
        <h3>會員: <%=memberName%></h3>
        <h1>歡迎使用 會員系統</h1>
    </body>
</html>
