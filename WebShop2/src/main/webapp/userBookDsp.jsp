<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.LoginBean" %>
<%
LoginBean logbean = (LoginBean) session.getAttribute("UserLogin");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<title>商品検索</title>
</head>
<body>
<h2>BookShop</h2>


	<% if(logbean != null){ %>

<nav>
<ul>
  <li><a href="./index.jsp">TOP</a></li>
</ul>
</nav>
<h3 id="head">検索</h3>
<%= logbean.getUname() %>さん、ログイン中
<div class="log"><a href="Logout">ログアウト</a></div>
	<% }else{ %>

<nav>
<ul>
  <li><a href="./index.jsp">TOP</a></li>
</ul>
</nav>
<h3 id="head">検索</h3>
		<p>商品を購入するにはログインが必要です</p>
		<div class="log"><a href="userlogin.jsp">ログイン</a></div>
	<% } %>
<p>検索条件をいずれか入力してください。<br>(何も入力しない場合、全件摘出されます)</p>
	<form action="BookSrv" method="post">
		<p>在庫無しも表示<input type="radio" id="huey" name="numflg" value="0" checked /><br>
		在庫有のみ表示<input type="radio" id="huey" name="numflg" value="1" /></p>
		<p>本ID   <input type="text" name="bid">
		<p>タイトル  <input type="text" name="title" class="c-form-text"></p>
		<p>出版社  <input type="text" name="cop" class="c-form-text"></p>
		<p>著者  <input type="text" name="auth" class="c-form-text"></p>
		<input type="hidden" name="mode" value="search">
		<input type="submit" value="検索" class="c-form-submit-button">
	</form>
	<form action="CartSrv" method="post">
	<input type="hidden" name="mode" value="by">
	<input type="submit" value="カートへ" class="c-form-submit-button">
	</form>
</body>
</html>