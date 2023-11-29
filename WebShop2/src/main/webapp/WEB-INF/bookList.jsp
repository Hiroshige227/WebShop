<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList,java.util.List" %>
<%@ page import="model.BookBean" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<title>書籍検索結果</title>
</head>
<body>
<% ArrayList<BookBean> array=(ArrayList<BookBean>)request.getAttribute("kekka"); %>
<% if(array==null){%>
<p>項目が見つかりませんでした</p>
<div class="log">
<a href="BookSrv">管理画面に戻る</a>
</div>
<% }else{ %>
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
	<td>
	<form action="BookSrv" method="POST">
	<input type="hidden" name="mode" value="delete">
	<input type="hidden" name="bid" value="<%=bookbean.getBid() %>">
	<input type="submit" value="削除">
	</form>
	</td>
	<td>
	<form action="BookSrv" method="POST">
	<input type="hidden" name="mode"  value="change">
	<input type="hidden" name="bid"   value="<%=bookbean.getBid() %>">
	<input type="hidden" name="title" value="<%=bookbean.getTitle() %>">
	<input type="hidden" name="cop"   value="<%=bookbean.getCop() %>">
	<input type="hidden" name="auth"  value="<%=bookbean.getAuth() %>">
	<input type="hidden" name="price" value="<%=bookbean.getPrice() %>">
	<input type="hidden" name="num"   value="<%=bookbean.getNum() %>">
	<input type="submit" value="変更">
	</form></td></tr>
	<% } %>
	</table>

<div class="log">
<a href="BookSrv">管理画面に戻る</a>
</div>
<% } %>
</body>
</html>