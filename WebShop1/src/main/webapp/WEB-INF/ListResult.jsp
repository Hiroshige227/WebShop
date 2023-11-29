<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList,java.util.List" %>
<%@ page import="model.CartBean" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% ArrayList<CartBean> array=(ArrayList<CartBean>)session.getAttribute("CartList"); %>
<% if(array!=null){ %>
	<table border="1">
	<tr bgcolor="#cccccc">
		<td><b>本ID</b></td>
		<td><b>タイトル</b></td>
		<td><b>価格</b></td>
		<td><b>注文数</b></td>
	</tr>
	<% for(CartBean cartbean : array){ %>
	<tr>
	<td><%= cartbean.getBid() %></td>
	<td><%= cartbean.getTitle() %></td>
	<td><%= cartbean.getPrice() %></td>
	<td><%= cartbean.getNumo() %></td>
	
	<% } %>	
	</tr>
	合計：<%= request.getAttribute("sum") %>円
	
	<form action="CartSrv" method="post">
		<input type="hidden" name="mode" value="bought">
		<input type="hidden" name="sum" value="<%= request.getAttribute("sum") %>">
		<input type="submit" value="購入">
	</form>
	<% }else{ %>
	検索結果が見つかりませんでした
	<% } %>
</body>
</html>