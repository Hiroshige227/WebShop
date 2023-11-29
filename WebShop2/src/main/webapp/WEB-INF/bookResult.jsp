<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String status=(String)request.getAttribute("status");
    %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<title>[処理結果] BookShop商品管理</title>
</head>
<body>
<h2>BookShop</h2>
<h3 id="head">処理結果</h3>
<% if(status.equals("成功しました")){%>
 <p>処理が正常に行われました</p>
  <div class="log">
 <a href="BookSrv">商品管理へ</a>
 </div>
 <% }else{ %>
 <p>処理に失敗しました</p>
  <div class="log">
 <a href="BookSrv">商品管理へ</a>
 </div>
 <% } %>
</body>
</html>