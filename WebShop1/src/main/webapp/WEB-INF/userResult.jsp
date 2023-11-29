<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.LoginBean" %>
    <%
    LoginBean logbean=(LoginBean)session.getAttribute("UserLogin");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン結果</title>
</head>
<body>
<h1>BookShopログイン結果</h1>
<% if(!(logbean==null)){%>
 <p>ログインに成功しました</p>
 <p>        <%=logbean.getUname()%>さん</p>
 <a href="index.jsp">BookShop</a>
 <% }else{ %>
 <p>ログインに失敗しました</p>
 <a href="userlogin.jsp">ログインへ</a>
 <% } %>
</body>
</html>