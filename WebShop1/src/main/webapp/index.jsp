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
<title>BookShop</title>
</head>
<body>
<h1 class=top>BookShop</h1>
<a href="userBookDsp.jsp">書籍の検索はこちら</a><br>

<% if(logbean != null){ %>
	 	<%= logbean.getUname()%>さん、ログイン中<br>
		<div class=log>
		<a href="Logout">ログアウト</a>
		</div>
		
		
		<form action="CartSrv" method="post">
			<input type="hidden" name="mode" value="by">
			<input type="submit" value="カートへ">
		</form>
	<% }else{ %>
		商品を購入するにはログインが必要です。<br>
		<div class=log>
		<a href="./userlogin.jsp">ログイン</a>
		<a href="./userMnte.jsp">新規登録</a><br>
		</div>
	<% } %>

</body>
</html>