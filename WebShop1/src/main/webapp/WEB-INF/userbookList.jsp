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
<title>BookShop検索結果</title>
</head>
<body>
<h2>BookShop</h2>
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
		<td><b>注文数</b></td>
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
	<input type="text" name="numo" value="1">
	</td>
	<td>
			<input type="hidden" name="bid" value="<%= bookbean.getBid() %>">
			<input type="hidden" name="title" value="<%= bookbean.getTitle() %>">
			<input type="hidden" name="price" value="<%= bookbean.getPrice() %>">
			<input type="hidden" name="mode" value="add">
			<input type="submit"  value="カートに追加">
			</form>
		</td>
	</tr>
	<% } %>
	<% }else{ %>
	検索結果が見つかりませんでした
	<% } %>
	<% } %>
	</table>
	<br>
	<a href="./userBookDsp.jsp">検索に戻る</a>
	<a href="./index.jsp">トップに戻る</a>
</body>
</html>