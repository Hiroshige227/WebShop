<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.ArrayList,java.util.List" %>
    <%@ page import="model.CartBean" %>
    <%
    String status=(String)request.getAttribute("status");
    %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<title>購入完了</title>
</head>
<body>
<h2>BookShop</h2>
<nav>
<ul>
  <li><a href="index.jsp">TOP</a></li>
  <li><a href="userBookDsp.jsp">SEARCH</a></li>
  <li><a href="Logout">LOGOUT</a></li>
  <li><a href="CartSrv">CART</a></li>
</ul>
</nav>
<% if(status.equals("成功しました")){%>
<h3>ご購入ありがとうございました</h3>
 <% ArrayList<CartBean> cartlist =new ArrayList<CartBean>();
	session.setAttribute("CartList", cartlist); %>
 <a href="index.jsp">トップへ</a>
 <% }else{ %>
 <p>処理に失敗しました</p>
 <p><%=request.getAttribute("nonumbname") %>の在庫がありませんでした</p>
 <div class="log">
 <a href="index.jsp">トップへ</a>
 </div>
 <% } %>
</body>
</html>