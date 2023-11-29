<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.LoginBean" %>
    <%
    LoginBean logbean=(LoginBean)session.getAttribute("KanriLogin");
    %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<title>BookShop商品管理</title>
</head>
<body>
<p id="hi">こんにちは、<%= logbean.getUname() %>さん</p>
<a href="Logout">ログアウト</a>
<h3 id="head">登録管理</h3>
<p id="to">検索条件を入力して下さい。<br>
    (何も入力しないと全件抽出します)</p>
<div class="add">
<form action="BookSrv" method="post">
<p>本ID  <input type="text" name="bid" class="c-form-text"></p>
<p>タイトル  <input type="text" name="title" class="c-form-text"></p>
<p>出版社  <input type="text" name="cop" class="c-form-text"></p>
<p>著者  <input type="text" name="auth" class="c-form-text"></p>
<p>価格  <input type="text" name="price" class="c-form-text"></p>
<input type="hidden" name="mode" value="search">
<input type="hidden" name="numflg" value="10">
<input type="submit" value="検索" class="c-form-submit-button">
</form>
</div>
<p id="to">登録する書籍の情報を入力してください。</p>
<form action="BookSrv" method="post">
<p>本ID（自動入力）  </p>
<p>タイトル  <input type="text" name="title" class="c-form-text"></p>
<p>出版社  <input type="text" name="cop" class="c-form-text"></p>
<p>著者  <input type="text" name="auth" class="c-form-text"></p>
<p>価格  <input type="text" name="price" class="c-form-text"></p>
<input type="hidden" name="mode" value="add">
<input type="submit" value="登録" class="c-form-submit-button">
</form>
</body>
</html>