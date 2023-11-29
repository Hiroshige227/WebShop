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
<h1>BookShop</h1>
<% if(logbean != null){ %>
<nav>
<ul>
  <li><a href="index.jsp">TOP</a></li>
  <li><a href="userBookDsp.jsp">SEARCH</a></li>
  <li><a href="Logout">LOGOUT</a></li>
  <li><a href="CartSrv">CART</a></li>
</ul>
</nav>

<p>書籍のオンライン販売専門店です。</p>
<div class="log">
<a href="userBookDsp.jsp">書籍の検索はこちら</a><br>
</div>
<p><%= logbean.getUname()%>さん、ログイン中</p>
<br>
<% }else{ %>
<nav>
<ul>
  <li><a href="index.jsp">TOP</a></li>
  <li><a href="userBookDsp.jsp">SEARCH</a></li>
  <li><a href="userlogin.jsp">LOGIN</a></li>
  <li><a href="userMnte.jsp">SIGN UP</a></li>
</ul>
</nav>
<p>書籍のオンライン販売専門店です。</p>
	<p>商品を購入するにはログインが必要です。</p>
		<div class="log">
		<a href="./userlogin.jsp">ログイン</a>
		<a href="./userMnte.jsp">新規登録</a><br>
		</div>
<% } %>

</body>
</html>