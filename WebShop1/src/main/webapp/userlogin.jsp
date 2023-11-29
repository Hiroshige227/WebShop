<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookShopログイン</title>
</head>
<body>
<h1>ログイン</h1>
<form action="Login" method="post">
ユーザーID:<input type="text" name="uid"><br>
パスワード:<input type="password" name="pas"><br>
<input type="hidden" name="mode" value="user">
<input type="submit" value="ログイン">
<a href="userMnte.jsp">アカウント作成される方はこちら</a>
</form>
</body>
</html>