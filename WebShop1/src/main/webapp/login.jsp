<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者ログイン</title>
</head>
<body>
<h1>BookShop管理者ログイン</h1>
<form action="Login" method="post">
ユーザーID:<input type="text" name="uid"><br>
パスワード:<input type="password" name="pas"><br>
<input type="hidden" name="mode" value="kanri">
<input type="submit" value="ログイン">
</form>
</body>
</html>