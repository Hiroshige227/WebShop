<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.ArrayList,java.util.List" %>
    <%@ page import="model.BookBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookShop</title>
</head>
<body>
<% ArrayList<CartBean> cartlist=(ArrayList<CartBean>)request.getAttribute("CartList"); %>
<% if(cartlist.isNull){ %>
カートに何も入っていません
<% }else{ %>
<table border="1">
	<tr bgcolor="#cccccc">
	<td><b>本ID：</b></td>
	<td><b>タイトル：</b></td>
	<td><b>値段：</b></td>
	<td><b>数量：</b></td>
	</tr>
<% for(CartBean cart : cartlist){ %>
	<tr>
	<td><%=cart.getBid() %></td>
	<td><%= cart.getTitle() %></td>
	<td><%= cart.getPrice() %></td>
	<td><%= cart.getNumo %></td>
	</tr>
<% } %>


</body>
</html>