<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.account.model.Account"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>My Account</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{

    background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
    display:flex;
    justify-content:center;
    align-items:center;
    min-height:100vh;

}

.card{

    width:550px;
    background:white;
    border-radius:20px;
    padding:40px;
    box-shadow:0 15px 35px rgba(0,0,0,.35);
    animation:fade .8s;

}

@keyframes fade{

from{

opacity:0;
transform:translateY(30px);

}

to{

opacity:1;
transform:translateY(0);

}

}

.logo{

text-align:center;
font-size:60px;
margin-bottom:10px;

}

h2{

text-align:center;
color:#0B1F42;
margin-bottom:25px;

}

.balance{

background:linear-gradient(135deg,#0B5ED7,#4A90E2);
color:white;
padding:20px;
border-radius:15px;
text-align:center;
margin-bottom:25px;

}

.balance h1{

font-size:36px;
margin-top:10px;

}

table{

width:100%;
border-collapse:collapse;

}

table td{

padding:15px;
border-bottom:1px solid #eee;

}

table td:first-child{

font-weight:bold;
color:#555;

}

.actions{

display:grid;
grid-template-columns:repeat(2,1fr);
gap:15px;
margin-top:30px;

}

.actions a{

text-decoration:none;
text-align:center;
padding:15px;
border-radius:10px;
background:#0B5ED7;
color:white;
font-weight:600;
transition:.3s;

}

.actions a:hover{

background:#084298;

}

.back{

margin-top:20px;
text-align:center;

}

.back a{

text-decoration:none;
color:#0B5ED7;
font-weight:bold;

}

.footer{

margin-top:25px;
text-align:center;
font-size:13px;
color:#777;

}

</style>

</head>

<body>

<%

Account account=(Account)request.getAttribute("account");

if(account==null){

%>

<div class="card">

<h2>No Account Found</h2>

<div class="back">

<a href="main.jsp">

← Back to Dashboard

</a>

</div>

</div>

<%

return;

}

%>

<div class="card">

<div class="logo">
🏦
</div>

<h2>Account Profile</h2>

<div class="balance">

<h3>Current Balance</h3>

<h1>$ <%=account.getBalance()%></h1>

</div>

<table>

<tr>

<td>User Name</td>

<td>

<%=account.getUserName()%>

</td>

</tr>

<tr>

<td>Account Number</td>

<td>

<%=account.getAccountNumber()%>

</td>

</tr>

<tr>

<td>Status</td>

<td>

<%=account.getStatus()%>

</td>

</tr>

</table>

<div class="actions">

<a href="deposit.jsp">

💰 Deposit

</a>

<a href="withdraw.jsp">

💸 Withdraw

</a>

<a href="transfer.jsp">

🔄 Transfer

</a>

<a href="TransactionController?action=showTransactions">

📄 Transactions

</a>

<a href="AccountController?action=showAccount">

🔄 Refresh

</a>

<a href="AccountController?action=dashboard">

🏠 Dashboard

</a>

</div>

<div class="footer">

Secure Banking System © 2026

</div>

</div>

</body>

</html>