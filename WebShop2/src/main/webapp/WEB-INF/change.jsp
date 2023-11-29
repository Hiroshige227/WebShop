<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="model.BookBean"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<title>[書籍登録情報変更]BookShop</title>
</head>
<body>
	<%
	BookBean bookbean = (BookBean) request.getAttribute("changeago");
	%>

<h2>BookShop</h2>
<h3 id="head">管理者ページ</h3>
<p id="to">以下から変更できます</p>
<br>
	<form action="BookSrv" method="POST">
		<p>BID  <%=bookbean.getBid()%>(変更不可) <input type="hidden" name="bid"
			value="<%=bookbean.getBid()%>"> タイトル:<%=bookbean.getTitle()%>
		<input type="text" name="title" value="<%=bookbean.getTitle()%>" class="c-form-text"></p>

		<p>出版社  <%=bookbean.getTitle()%>
		<input type="text" name="cop" value="<%=bookbean.getCop()%>" class="c-form-text"></p>

		<p>著者  <%=bookbean.getAuth()%>
		<input type="text" name="auth" value="<%=bookbean.getAuth()%>" class="c-form-text"></p>

		<p>価格  <%=bookbean.getPrice()%>
		<input type="text" name="price" value="<%=bookbean.getPrice()%>" class="c-form-text"></p>

		<p>在庫数  <%=bookbean.getNum()%>
		<input type="text" name="num" value="<%=bookbean.getNum()%>" class="c-form-text"></p>

		<br>
		<input type="hidden" name="mode" value="del_add">
		<input type="submit" value="変更確定" class="c-form-submit-button">
	</form>
	<br>
	<div class="log">
	<a href="BookSrv">トップに戻る</a>
	</div>

</body>
</html>
>
