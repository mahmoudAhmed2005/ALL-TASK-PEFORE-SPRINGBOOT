<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>E-Wallet Login</title>

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
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;

}

.container{

    width:400px;
    background:white;
    border-radius:20px;
    padding:40px;
    box-shadow:0 15px 35px rgba(0,0,0,.3);
    animation:fadeIn .8s;

}

@keyframes fadeIn{

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
margin-bottom:30px;

}

.input-group{

margin-bottom:20px;

}

.input-group label{

display:block;
margin-bottom:8px;
font-weight:600;
color:#555;

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
box-shadow:0 0 8px rgba(13,110,253,.3);

}

.password-box{

position:relative;

}

.password-box span{

position:absolute;
right:15px;
top:50%;
transform:translateY(-50%);
cursor:pointer;
font-size:20px;

}

button{

width:100%;
padding:15px;
border:none;
border-radius:10px;
background:#0B5ED7;
color:white;
font-size:18px;
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

display:block;
margin-top:12px;
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
font-size:13px;
color:#777;

}

.error{

color:red;
font-size:13px;
margin-top:5px;
display:none;

}

</style>

</head>

<body>

<div class="container">

<div class="logo">
💳
</div>

<h2>E-Wallet Login</h2>

<form id="loginForm" action="/E-wallet/UserController" method="post">

<input
type="hidden"
name="action"
value="logIn">

<div class="input-group">

<label>User Name</label>

<input
type="text"
id="userName"
name="userName"
placeholder="Enter your username">

<div id="userError" class="error">
User Name must be at least 3 characters.
</div>

</div>

<div class="input-group">

<label>Password</label>

<div class="password-box">

<input
type="password"
id="password"
name="password"
placeholder="Enter your password">

<span id="togglePassword">
👁
</span>

</div>

<div id="passError" class="error">
Password must be at least 8 characters.
</div>

</div>

<button
id="loginBtn"
type="submit">

Login

</button>

</form>

<div class="links">

<a href="signup.jsp">

Create New Account

</a>

<a href="check-userName.jsp">

Forgot Password?

</a>

</div>

<div class="footer">

Secure Banking System © 2026

</div>

</div>

<script>

const form=document.getElementById("loginForm");

const user=document.getElementById("userName");

const pass=document.getElementById("password");

const loginBtn=document.getElementById("loginBtn");

const toggle=document.getElementById("togglePassword");

const userError=document.getElementById("userError");

const passError=document.getElementById("passError");

toggle.onclick=function(){

if(pass.type==="password"){

pass.type="text";
toggle.innerHTML="🙈";

}else{

pass.type="password";
toggle.innerHTML="👁";

}

};

form.addEventListener("submit",function(e){

let valid=true;

userError.style.display="none";
passError.style.display="none";

if(user.value.trim().length<3){

userError.style.display="block";
user.focus();
valid=false;

}

if(pass.value.trim().length<8){

passError.style.display="block";

if(valid){

pass.focus();

}

valid=false;

}

if(!valid){

e.preventDefault();
return;

}

loginBtn.innerHTML="Logging in...";
loginBtn.disabled=true;

});

</script>

</body>
</html>