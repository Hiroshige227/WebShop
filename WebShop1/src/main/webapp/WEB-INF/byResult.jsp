<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import ="java.util.ArrayList,java.util.List" %>
    <%@ page import="model.CartBean" %>
    <%
    String status=(String)request.getAttribute("status");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購入完了</title>
</head>
<body>
<h2>BookShop</h2>
<% System.out.println("一番初め"); %>
<% if(status.equals("成功しました")){%>
 <p>ご購入ありがとうございました！</p>
 <% ArrayList<CartBean> cartlist =new ArrayList<CartBean>();
	session.setAttribute("CartList", cartlist); %>
 <a href="index.jsp">トップへ</a>
 <% }else{ %>
 <% System.out.println("在庫なし"); %>
 <p><%=request.getAttribute("nonumbname") %>の在庫がありませんでした</p>
 <a href="index.jsp">トップへ</a>
 <% } %>
</body>
</html>