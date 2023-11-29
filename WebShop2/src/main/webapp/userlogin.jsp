<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<title>BookShopログイン</title>
</head>
<body>

<h2>BookShop</h2>
<nav>
<ul>
	<li><a href="index.jsp">TOP</a></li>
	<li><a href="userBookDsp.jsp">SEARCH</a></li>
</ul>
</nav>
<h3 id="head">ログイン</h3>
<form action="Login" method="post">
<p>ID  <input type="text" name="uid" class="c-form-text"></p>
<p>パスワード  <input type="password" name="pas" class="c-form-text"></p>
<input type="hidden" name="mode" value="user">
<input type="submit" value="ログイン" class="c-form-submit-button">
<p>アカウントをお持ちでない方は<a href="userMnte.jsp">新規登録</a></p>
</form>
</body>
</html>