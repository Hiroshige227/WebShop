<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String status=(String)request.getAttribute("status");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者ログイン結果</title>
</head>
<body>
<h1>管理者ログイン結果</h1>
<% if(status.equals("成功しました")){%>
 <p>処理が正常に行われました</p>
 <a href="BookSrv">商品管理へ</a>
 <% }else{ %>
 <p>処理に失敗しました</p>
 <a href="BookSrv">商品管理へ</a>
 <% } %>
</body>
</html>