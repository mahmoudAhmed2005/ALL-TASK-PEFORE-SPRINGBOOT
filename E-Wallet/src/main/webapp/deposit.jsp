<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Deposit Money</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{

    display:flex;
    justify-content:center;
    align-items:center;
    min-height:100vh;
    background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);

}

.container{

    width:430px;
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
margin-bottom:10px;

}

.subtitle{

text-align:center;
color:#666;
margin-bottom:30px;

}

.input-group{

margin-bottom:20px;

}

.input-group label{

display:block;
margin-bottom:8px;
font-weight:600;
color:#444;

}

.input-group input{

width:100%;
padding:14px;
border:1px solid #ccc;
border-radius:10px;
font-size:16px;
outline:none;
transition:.3s;

}

.input-group input:focus{

border-color:#0B5ED7;
box-shadow:0 0 10px rgba(13,110,253,.3);

}

.error{

display:none;
margin-top:6px;
color:red;
font-size:13px;

}

button{

width:100%;
padding:15px;
background:#0B5ED7;
color:white;
border:none;
border-radius:10px;
font-size:17px;
cursor:pointer;
transition:.3s;

}

button:hover{

background:#084298;

}

button:disabled{

background:gray;
cursor:not-allowed;

}

.links{

margin-top:25px;
text-align:center;

}

.links a{

text-decoration:none;
color:#0B5ED7;
font-weight:600;

}

.links a:hover{

text-decoration:underline;

}

.footer{

margin-top:30px;
text-align:center;
color:#777;
font-size:13px;

}

</style>

</head>

<body>

<div class="container">

<div class="logo">
💰
</div>

<h2>Deposit Money</h2>

<p class="subtitle">

Add money safely to your account

</p>

<form
id="depositForm"
action="AccountController"
method="post">

<input
type="hidden"
name="action"
value="deposit">

<div class="input-group">

<label>Deposit Amount</label>

<input
type="number"
id="amount"
name="amount"
step="0.01"
placeholder="Enter amount">

<div
id="amountError"
class="error">

Please enter an amount greater than zero.

</div>

</div>

<button
id="depositBtn"
type="submit">

Deposit Money

</button>

</form>

<div class="links">

<a href="AccountController?action=dashboard">

← Back To Dashboard

</a>

</div>

<div class="footer">

Secure Banking System © 2026

</div>

</div>

<script>

const form=document.getElementById("depositForm");

const amount=document.getElementById("amount");

const error=document.getElementById("amountError");

const button=document.getElementById("depositBtn");

form.addEventListener("submit",function(e){

error.style.display="none";

if(amount.value==="" || parseFloat(amount.value)<=0){

error.style.display="block";
amount.focus();
e.preventDefault();
return;

}

button.innerHTML="Processing...";
button.disabled=true;

});

</script>

</body>

</html>