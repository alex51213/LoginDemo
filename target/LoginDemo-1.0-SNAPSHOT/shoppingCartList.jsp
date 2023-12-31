<%-- 
    Document   : shoppingCartList
    Created on : 2023年12月22日, 上午9:54:07
    Author     : student
--%>

<%@page import="com.mycompany.logindemo.CartItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.logindemo.ProductModel"%>
<%@page import="com.mycompany.logindemo.ProductModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
              border-collapse: collapse;
              width: 85%;
              margin-left: auto;
              margin-right: auto;
            }

            th, td {
              padding: 8px;
              text-align: left;
              border-bottom: 1px solid #ddd;
            }

            tr:hover {background-color:#f5ff5f;}
            
            input[type=button], input[type=submit], input[type=reset] {
              background-color: #00FFFF;
              border: none;
              color: white;
              padding: 16px 32px;
              text-decoration: none;
              margin: 4px 2px;
              cursor: pointer;
            }
        </style>
    </head>
        <% 
            ArrayList<CartItem> cart=null;
            cart=(ArrayList)session.getAttribute("cart");
            // 購物車上未建立 或是 空的
        %>
    <body>
       
        <h1>購物車明細</h1>
        
        <% if(cart!= null && cart.size() > 0) { %>  <%--請注意此行用 || && 的邏輯問題 --%>
        <table>
            <tr>
              <th>產品編號</th>
              <th>產品名稱</th>
              <th>訂購數量</th>
            </tr>
            <%--  如有商品 在此處進行迴圈 顯示購物車內商品--%>
            <% for(CartItem cpm : cart) { %>
            <tr>
               <td><%= cpm.getProductCode() %></td>
               <td><%= cpm.getProductName() %></td>
               <td><%= cpm.getQty() %></td>
            </tr>
            <% } %>
           </table>
           <button onclick="CheckItOut()">結帳去</button>
           <button onclick="location.href='CheckOut.jsp'">結帳去2</button>
        <% } else { %>
        <h2>您尚未有商品放在購物車</h2>
        <% } %>
    </body>
    <script>
        function CheckItOut(){
            location.href='CheckOut.jsp'
        }
    </script>
</html>
