<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.LoginBean" %>
    <%
    LoginBean logbean=(LoginBean)session.getAttribute("KanriLogin");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者ログイン結果</title>
</head>
<body>
<h1>管理者ログイン結果</h1>
<% if(!(logbean==null)){%>
 <p>ログインに成功しました</p>
 <p>        <%=logbean.getUname()%>さん</p>
 <a href="BookSrv">商品管理へ</a>
 <% }else{ %>
 <p>ログインに失敗しました</p>
 <a href="login.jsp">管理者ログイン画面へ</a>
 <% } %>
</body>
</html>