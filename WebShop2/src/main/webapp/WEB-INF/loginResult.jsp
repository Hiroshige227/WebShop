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
<title>管理者ログイン結果</title>
</head>
<body>
<h2>BookShop</h2>
<h3 id="head">管理者ページ</h3>
<% if(!(logbean==null)){%>
<p>ログインに成功しました</p>
<p>こんにちは、<%=logbean.getUname()%>さん</p>
<div class="log">
<a href="BookSrv">商品管理へ</a>
</div>
<% }else{ %>
<p>ログインに失敗しました</p>
<div class="log">
<a href="login.jsp">管理者ログイン画面へ</a>
</div>
<% } %>
</body>
</html>