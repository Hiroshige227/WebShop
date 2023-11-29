<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.LoginBean" %>
    <%
    LoginBean logbean=(LoginBean)session.getAttribute("UserLogin");
    %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<title>ログイン結果</title>
</head>
<body>
<h2>BookShop</h2>
<h3 id="head">ログイン結果</h3>
<% if(!(logbean==null)){%>
 <p>ログインに成功しました</p>
 <p>こんにちは、<%=logbean.getUname()%>さん<br>当サイトでのお買い物をお楽しみください。</p>
 <div class="log">
 <a href="index.jsp">トップへ</a>
 <div class="log">
 <% }else{ %>
 <p>ログインに失敗しました</p>
 <div class="log"><a href="userlogin.jsp">再試行</a></div>
<% } %>
</body>
</html>