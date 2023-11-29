<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.LoginBean" %>
    <%
    LoginBean logbean=(LoginBean)session.getAttribute("KanriLogin");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookShop商品管理</title>
</head>
<body>
こんにちは<%= logbean.getUname() %>さん
<a href="Logout">ログアウト</a>
<h1>登録管理</h1>
<br>検索条件を入力して下さい。
<br>(何も入力しないと全件抽出します)
<br><br>
<form action="BookSrv" method="post">
本ID:<input type="text" name="bid">
タイトル:<input type="text" name="title">
出版社:<input type="text" name="cop">
著者:<input type="text" name="auth">
価格:<input type="text" name="price">
<input type="hidden" name="mode" value="search">
<input type="hidden" name="numflg" value="10">
<input type="submit" value="検索">
</form>

登録
<form action="BookSrv" method="post">
本ID：（自動入力）　　　
タイトル:<input type="text" name="title">
出版社:<input type="text" name="cop">選ばせるほうがいいかも
著者:<input type="text" name="auth">
価格:<input type="text" name="price">
<input type="hidden" name="mode" value="add">
<input type="submit" value="登録">
</form>
</body>
</html>