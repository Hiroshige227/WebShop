<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "model.LoginBean" %>
    <%LoginBean logbean=(LoginBean)request.getAttribute("uidreturn");%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<title>新規会員登録</title>
</head>
<body>
<h2>BookShop</h2>
<nav>
<ul>
  <li><a href="index.jsp">TOP</a></li>
  <li><a href="userBookDsp.jsp">SEARCH</a></li>
  <li><a href="userlogin.jsp">LOGIN</a></li>
  <li><a href="userMnte.jsp">SIGN UP</a></li>
</ul>
</nav>
<% if(logbean == null){%>
<h3>新規会員登録</h3>
<p>以下からユーザー登録ができます</p>
<form action="Login" method="post">
<p>ユーザー名<span>*必須</span>  <input type="text" name="uname" class="c-form-text"></p>
<p>パスワード<span>*必須</span>  <input type="password" name="pas" class="c-form-text"></p>
<p>メールアドレス<span>*必須</span>  <input type="text" name="adr" class="c-form-text"></p>
<input type="hidden" name="mode" value="add">
<input type="submit" value="登録" class="c-form-submit-button">
</form>
<% }else if(logbean != null){ %>
<% System.out.print(logbean.getUname());%>
<h3 id="head">アカウントを作成しました</h3>
<p>ようこそ、<%=logbean.getUname()%>さん</p>
<h4>あなたのIDは<%=logbean.getUid() %>です</h4>
<div class="log"><a href="userlogin.jsp">ログインへ</a></div>
<% }else{ %>
<p>アカウント生成に失敗しました</p>
<div class="log">
<a href="userlogin.jsp">再試行</a>
<a href="BookSrv">トップへ</a>
</div>
<% } %>
</body>
</html>