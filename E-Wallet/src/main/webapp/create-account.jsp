<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<html>

<head>

<title>Create Account</title>

</head>


<body>


<h2 align="center">
Create Account
</h2>



<form action="/E-wallet/AccountController" method="post">


<input type="hidden"
name="action"
value="createAccount">



<table align="center">


<tr>

<td>

<button type="submit">

Create Account

</button>

</td>


</tr>


</table>



</form>



<br>


<center>

<a href="profile.jsp">
Back Profile
</a>

</center>



</body>

</html>