<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Find Your Account</title>

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

    width:420px;
    background:#fff;
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
color:#777;
margin-bottom:30px;

}

.input-group{

margin-bottom:20px;

}

.input-group label{

display:block;
font-weight:600;
margin-bottom:8px;
color:#444;

}

.input-group input{

width:100%;
padding:14px;
font-size:15px;
border:1px solid #ccc;
border-radius:10px;
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

text-align:center;
margin-top:25px;

}

.links a{

text-decoration:none;
font-weight:600;
color:#0B5ED7;

}

.links a:hover{

text-decoration:underline;

}

.footer{

text-align:center;
margin-top:30px;
color:#777;
font-size:13px;

}

</style>

</head>

<body>

<div class="container">

<div class="logo">
🔍
</div>

<h2>Find Your Account</h2>

<p class="subtitle">
Enter your username to continue.
</p>

<form
id="checkForm"
action="/E-wallet/UserController"
method="post">

<input
type="hidden"
name="action"
value="checkUserName">

<div class="input-group">

<label>Username</label>

<input
type="text"
id="userName"
name="userName"
placeholder="Enter your username">

<div
id="userError"
class="error">

Username must be at least 3 characters.

</div>

</div>

<button
id="checkBtn"
type="submit">

Check Username

</button>

</form>

<div class="links">

<a href="login.jsp">

← Back To Login

</a>

</div>

<div class="footer">

Secure Banking System © 2026

</div>

</div>

<script>

const form=document.getElementById("checkForm");

const user=document.getElementById("userName");

const error=document.getElementById("userError");

const btn=document.getElementById("checkBtn");

form.addEventListener("submit",function(e){

error.style.display="none";

if(user.value.trim().length<3){

error.style.display="block";
user.focus();
e.preventDefault();
return;

}

btn.innerHTML="Checking...";
btn.disabled=true;

});

</script>

</body>
</html>