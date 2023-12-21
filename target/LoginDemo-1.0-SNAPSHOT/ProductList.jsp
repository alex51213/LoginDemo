<%-- 
    Document   : ProductList
    Created on : 2023年12月20日, 下午3:37:54
    Author     : student
--%>

<%@page import="com.mycompany.logindemo.DBConGenerator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Statement" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
            <style>
            table, th, td {
              border: 1px solid black;
              border-collapse: collapse;
            }
            th, td {
              padding: 5px;
              text-align: left;
            }
            table.names {
              width: 100%;    
              background-color: #f1f1c1;
            }
            </style>
    </head>
     <%--  
            1. 連結資料庫
            2. 取得連線
            3. 根據條件 建立 sql -->  select * from products where productLine  符合 classic cars , motorcycle, vintage cars .....
            4. 送出查詢 取得結果
            5. 安排迴圈顯示在 table 內
       --%>
       <%!
           java.sql.Connection con=null;
           java.sql.ResultSet rs=null;
           Statement stmt=null;
           String productLine=null;
           String shoppingUrl="#";
       %>
       
       <%
           int p1Type=Integer.valueOf(request.getParameter("p1"));
           // 請注意 跨資料庫查詢時要加上  Database.Table 格式
           String sql = "Select * from classicmodels.products where productLine = '";          
          
          // 準備資料查詢工作
          DBConGenerator dbg = new DBConGenerator();
          con = dbg.getConnction();
          stmt = con.createStatement();
          //
          
          switch( p1Type ) {
              case 1:
                  // 這是 選項一  : Class Cars
                  productLine = "Classic Cars";
                  sql = sql + productLine +"';";
                  break;
              case 2:
                  // 這是 選項一  : Class Cars
                  productLine = "Motorcycles";
                  sql = sql + productLine +"';";
                  break;
               case 3:
                  // 這是 選項一  : Class Cars
                  productLine = "Trucks and Buses";
                  sql = sql + productLine +"';";
                  break;
          }
          try {
            rs = stmt.executeQuery(sql);
           }catch( Exception e) { }
       %>
       
    <body>
         <h1>商品列表</h1>
          <h3> 查詢類型: <%= productLine %> </h3>
        <h3>語法: <%= sql %> </h3>
    <table style="width:100%">
    <tr>
      <th>商品編碼</th>
      <th>商品名稱</th> 
      <th>商品比例</th>
      <th>商品數量</th>
      <th>商品價格</th>
      <th>購物</th>
    </tr>
      <%--   rs.next 迴圈開始 --%> 
      <% try {
            while(rs.next() ) {
           shoppingUrl ="ToshoppingCart.jsp?pid="+rs.getString("productCode")+"&pname="+rs.getString("productName");
       %>
            <tr>
              <td><%= rs.getString("productCode") %></td>
              <td><%= rs.getString("productName") %></td>
              <td><%= rs.getString("productScale") %></td>
              <td><%= rs.getInt("quantityInStock") %></td>
              <td><%= rs.getBigDecimal("MSRP").toString() %></td>   
              <td><a href="<%= shoppingUrl %>">加入購物車</a></td>
            </tr>
        <% }
            // 釋放所有資源
            rs.close();
            stmt.close();
            con.close();
            }catch(Exception e) {
            
            }
        %>
 
  
</table>
         <h3>查詢類型: <%= request.getParameter("p1") %></h3>
    </body>
</html>
