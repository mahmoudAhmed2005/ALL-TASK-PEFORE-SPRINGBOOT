<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>E-Wallet - Sign Up</title>

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

    width:450px;
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
margin-bottom:30px;

}

.input-group{

margin-bottom:18px;

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

button{

width:100%;
padding:15px;
font-size:17px;
background:#0B5ED7;
color:white;
border:none;
border-radius:10px;
cursor:pointer;
transition:.3s;

}

button:hover{

background:#084298;

}

button:disabled{

background:gray;

}

.error{

color:red;
font-size:13px;
display:none;
margin-top:5px;

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
💳
</div>

<h2>Create New Account</h2>

<form id="signupForm"
action="/E-wallet/UserController"
method="post">

<input
type="hidden"
name="action"
value="SignUp">

<div class="input-group">

<label>User Name</label>

<input
type="text"
id="userName"
name="userName"
placeholder="Enter User Name">

<div id="userError" class="error">
User name must be at least 3 characters.
</div>

</div>

<div class="input-group">

<label>Password</label>

<div class="password-box">

<input
type="password"
id="password"
name="password"
placeholder="Enter Password">

<span id="togglePassword">
👁
</span>

</div>

<div id="passError" class="error">
Password must be at least 8 characters.
</div>

</div>

<div class="input-group">

<label>Phone</label>

<input
type="text"
id="phone"
name="phone"
placeholder="Enter Phone Number">

<div id="phoneError" class="error">
Phone must contain exactly 11 digits.
</div>

</div>

<div class="input-group">

<label>Age</label>

<input
type="number"
id="age"
name="age"
placeholder="Enter Age">

<div id="ageError" class="error">
Age must be at least 18 years.
</div>

</div>

<button
id="signupBtn"
type="submit">

Create Account

</button>

</form>

<div class="links">

Already have an account?

<a href="login.jsp">

Login

</a>

</div>

<div class="footer">

Secure Banking System © 2026

</div>

</div>
<script>


const form = document.getElementById("signupForm");


const userName = document.getElementById("userName");

const password = document.getElementById("password");

const phone = document.getElementById("phone");

const age = document.getElementById("age");



const userError = document.getElementById("userError");

const passError = document.getElementById("passError");

const phoneError = document.getElementById("phoneError");

const ageError = document.getElementById("ageError");




const togglePassword =
document.getElementById("togglePassword");



// Show / Hide Password

togglePassword.onclick = function(){


    if(password.type === "password"){


        password.type="text";

        togglePassword.innerHTML="🙈";


    }else{


        password.type="password";

        togglePassword.innerHTML="👁";


    }


};





form.addEventListener("submit",function(e){



    let valid = true;



    // Username validation

    if(userName.value.trim().length < 3){


        userError.style.display="block";

        valid=false;


    }else{


        userError.style.display="none";


    }





    // Password validation

    if(password.value.length < 8){


        passError.style.display="block";

        valid=false;


    }else{


        passError.style.display="none";


    }






    // Phone validation

    let phonePattern = /^[0-9]{11}$/;



    if(!phonePattern.test(phone.value)){


        phoneError.style.display="block";

        valid=false;


    }else{


        phoneError.style.display="none";


    }






    // Age validation


    if(age.value < 18 || age.value===""){


        ageError.style.display="block";

        valid=false;


    }else{


        ageError.style.display="none";


    }





    // Stop submit if invalid

    if(!valid){


        e.preventDefault();


    }



});







// Live validation username

userName.addEventListener("input",function(){


    if(userName.value.length >=3){


        userError.style.display="none";


    }


});






// Live validation password

password.addEventListener("input",function(){


    if(password.value.length >=8){


        passError.style.display="none";


    }


});







// Live phone validation

phone.addEventListener("input",function(){



    if(/^[0-9]{11}$/.test(phone.value)){


        phoneError.style.display="none";


    }


});







// Live age validation

age.addEventListener("input",function(){


    if(age.value >=18){


        ageError.style.display="none";


    }


});



</script>

</body>
</html>