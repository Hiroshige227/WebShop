<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="model.BookBean"%>
<html>
<body>
	<%
	BookBean bookbean = (BookBean) request.getAttribute("changeago");
	%>

	<br> 以下から変更できます
	<br>
	<br>
	<form action="BookSrv" method="POST">
		BID:<%=bookbean.getBid()%>(変更不可) <input type="hidden" name="bid"
			value="<%=bookbean.getBid()%>"> タイトル:<%=bookbean.getTitle()%>
		<input type="text" name="title" value="<%=bookbean.getTitle()%>">

		出版社:<%=bookbean.getTitle()%>
		<input type="text" name="cop" value="<%=bookbean.getCop()%>">

		著者:<%=bookbean.getAuth()%>
		<input type="text" name="auth" value="<%=bookbean.getAuth()%>">

		価格:<%=bookbean.getPrice()%>
		<input type="text" name="price" value="<%=bookbean.getPrice()%>">

		在庫数:<%=bookbean.getNum()%>
		<input type="text" name="num" value="<%=bookbean.getNum()%>">

		<br>
		<br> <input type="hidden" name="mode" value="del_add"> <input
			type="submit" value="変更確定">
	</form>
	<br>
	<a href="BookSrv">トップに戻る</a>

</body>
</html>

