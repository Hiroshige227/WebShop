<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import ="java.util.ArrayList,java.util.List" %>
<%@ page import="model.LoginBean" %>
<%@ page import="model.BookBean" %>
<%@ page import="java.sql.*" %>
	<%
    LoginBean logbean=(LoginBean)session.getAttribute("UserLogin");
    %>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<title>[検索結果]BookShop</title>
</head>
<body>
<h2>BookShop</h2>
<h3>検索結果</h3>
	<br>
	<% ArrayList<BookBean> array=(ArrayList<BookBean>)request.getAttribute("kekka"); %>
	<% if(logbean==null){ %>
	<table border="1">
	<tr bgcolor="#cccccc">
		<td><b>本ID</b></td>
		<td><b>タイトル</b></td>
		<td><b>出版社</b></td>
		<td><b>著者</b></td>
		<td><b>価格</b></td>
		<td><b>在庫数</b></td>
		</tr>
	<% for(BookBean bookbean : array){ %>
	<tr>
	<td><%= bookbean.getBid() %></td>
	<td><%= bookbean.getTitle() %></td>
	<td><%= bookbean.getCop() %></td>
	<td><%= bookbean.getAuth() %></td>
	<td><%= bookbean.getPrice() %></td>
	<td><%= bookbean.getNum() %></td>
	</tr>
	<% } %>
	<% }else{ %>
	<% if(array!=null){ %>
	<table border="1">
	<tr bgcolor="#cccccc">
		<td><b>本ID</b></td>
		<td><b>タイトル</b></td>
		<td><b>出版社</b></td>
		<td><b>著者</b></td>
		<td><b>価格</b></td>
		<td><b>在庫数</b></td>
		<td id="1"><b>注文数</b></td>
		<td><b></b></td>
	</tr>
	<% for(BookBean bookbean : array){ %>
	<tr>
	<td><%= bookbean.getBid() %></td>
	<td><%= bookbean.getTitle() %></td>
	<td><%= bookbean.getCop() %></td>
	<td><%= bookbean.getAuth() %></td>
	<td><%= bookbean.getPrice() %></td>
	<td><%= bookbean.getNum() %></td>
		<form action="CartSrv" method="post">
	<td>
	<input type="text" name="numo" value="1" class="c-form-text">
	</td>
	<td>
			<input type="hidden" name="bid" value="<%= bookbean.getBid() %>">
			<input type="hidden" name="title" value="<%= bookbean.getTitle() %>">
			<input type="hidden" name="price" value="<%= bookbean.getPrice() %>">
			<input type="hidden" name="list" value="<%= array %>">
			<input type="submit"  value="カートに追加" class="c-form-submit-button">
			</form>
		</td>
	</tr>
	<% } %>
	<% }else{ %>
	<p>検索結果が見つかりませんでした</p>
	<% } %>
	<% } %>
	</table>
	<br>
	<div class="log">
	<a href="./index.jsp">トップに戻る</a>
	</div>
</body>
</html>