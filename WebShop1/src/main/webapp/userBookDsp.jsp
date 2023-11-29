<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.LoginBean" %>
<%
LoginBean logbean = (LoginBean) session.getAttribute("UserLogin");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品検索</title>
</head>
<body>
<h2>BookShop</h2>
	<% if(logbean != null){ %>
		<%= logbean.getUname() %>さん、ログイン中
		<a href="Logout">ログアウト</a>
	<% }else{ %>
		商品を購入するにはログインが必要です
		<a href="userlogin.jsp">ログイン</a>
	<% } %>
	<br>
	<br>
	
	<form action="BookSrv" method="post">
	在庫無しも表示<input type="radio" id="huey" name="numflg" value="0" checked /><br>
	在庫有のみ表示<input type="radio" id="huey" name="numflg" value="1" /><br>
		本ID:<input type="text" name="bid">
		タイトル : <input type="text" name="title">
		出版社 : <input type="text" name="cop">
		著者 : <input type="text" name="auth">
		<input type="hidden" name="mode" value="search">
		
		<input type="submit" value="検索"><br>
	</form>
	<br>
</body>
</html>