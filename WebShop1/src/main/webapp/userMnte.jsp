<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "model.LoginBean" %>
    <%LoginBean logbean=(LoginBean)request.getAttribute("uidreturn");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザー登録</title>
</head>
<body>
<h1>BookShop</h1>
<% if(logbean == null){%>
以下からユーザー登録ができます
<form action="Login" method="post">
ユーザー名：(必須)<input type="text" name="uname"><br>
パスワード:(必須)<input type="password" name="pas"><br>
メールアドレス：<input type="text" name="adr">
<input type="hidden" name="mode" value="add">
<input type="submit" value="登録">
</form>
<% }else if(logbean != null){ %>
	<% System.out.print(logbean.getUname());%>
<p>アカウントを作成しました</p>
 <p><%=logbean.getUname()%>さん</p>
 <h4>あなたのIDは<%=logbean.getUid() %>です</h4>
 <a href="userlogin.jsp">ログインへ</a>
 
 <% }else{ %>
 <p>ログインに失敗しました</p>
 <a href="userlogin.jsp">やり直す</a>
 トップページへ
 <% } %>
</body>
</html>