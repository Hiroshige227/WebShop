<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<title>管理者ログイン</title>
</head>
<body>
<h2>BookShop</h2>
<nav>
<ul>
	<li><a href="index.jsp">TOP</a></li>
	<li><a href="userBookDsp.jsp">USER LOGIN</a></li>
</ul>
</nav>
<h3 id="head">BookShop管理者ログイン</h3>
<form action="Login" method="post">
<div class="textbox">
	<p>管理者ID <input type="text" name="uid" class="c-form-text"></p>
    <p>パスワード <input type="password" name="pas" class="c-form-text"></p>
</div>
<input type="hidden" name="mode" value="kanri">
<input type="submit" value="ログイン" class="c-form-submit-button">
</form>
</body>
</html>