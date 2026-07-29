<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Reset Password</title>

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

.container{

    width:430px;
    background:white;
    padding:40px;
    border-radius:20px;
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
margin-bottom:8px;
font-weight:600;
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

margin-top:30px;
text-align:center;
font-size:13px;
color:#777;

}

</style>

</head>

<body>

<%

String userName=(String)session.getAttribute("checkUserName");

%>

<div class="container">

<div class="logo">
🔒
</div>

<h2>Reset Password</h2>

<p class="subtitle">

Create a new secure password

</p>

<form
id="resetForm"
action="/E-wallet/UserController"
method="post">

<input
type="hidden"
name="action"
value="resetPassword">

<div class="input-group">

<label>Username</label>

<input
type="text"
name="userName"
value="<%=userName%>"
readonly>

</div>

<div class="input-group">

<label>New Password</label>

<div class="password-box">

<input
type="password"
id="password"
name="newPassword"
placeholder="Enter new password">

<span id="togglePassword">
👁
</span>

</div>

<div
id="passError"
class="error">

Password must contain at least 8 characters.

</div>

</div>

<button
id="resetBtn"
type="submit">

Reset Password

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

const password=document.getElementById("password");

const toggle=document.getElementById("togglePassword");

const form=document.getElementById("resetForm");

const error=document.getElementById("passError");

const button=document.getElementById("resetBtn");

toggle.onclick=function(){

if(password.type==="password"){

password.type="text";
this.innerHTML="🙈";

}else{

password.type="password";
this.innerHTML="👁";

}

};

form.addEventListener("submit",function(e){

error.style.display="none";

if(password.value.trim().length<8){

error.style.display="block";
password.focus();
e.preventDefault();
return;

}

button.innerHTML="Updating...";
button.disabled=true;

});

</script>

</body>

</html>