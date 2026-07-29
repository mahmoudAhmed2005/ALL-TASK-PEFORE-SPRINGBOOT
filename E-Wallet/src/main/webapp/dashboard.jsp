<%@page import="com.account.model.Account"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="com.account.model.Account" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>
E-Wallet Dashboard
</title>


<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">



<style>


*{

margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;

}



body{

background:#f4f7fc;

}



.container{

display:flex;
min-height:100vh;

}



/* Sidebar */


.sidebar{

width:260px;
background:#0B1F42;
color:white;
padding:30px 20px;
display:flex;
flex-direction:column;

}



.logo{

font-size:30px;
font-weight:bold;
margin-bottom:40px;

}



.sidebar a{

color:white;
text-decoration:none;
padding:15px;
margin-bottom:12px;
border-radius:10px;
transition:.3s;

}



.sidebar a:hover{

background:#1f4ba5;

}



/* Main */


.main{

flex:1;
padding:35px;

}




.header{

display:flex;
justify-content:space-between;
align-items:center;
margin-bottom:35px;

}



.header h2{

color:#222;

}



.header p{

color:#777;

}



.logout{

background:#e74c3c;
color:white;
padding:12px 25px;
border-radius:8px;
text-decoration:none;

}



.logout:hover{

background:#c0392b;

}




/* Cards */


.cards{

display:grid;
grid-template-columns:repeat(3,1fr);
gap:20px;

}



.card{

background:white;
padding:25px;
border-radius:15px;
box-shadow:0 10px 20px rgba(0,0,0,.08);

}



.card h3{

color:#777;

}



.card h1{

font-size:38px;
margin:15px 0;

}




.balance{

background:linear-gradient(
135deg,
#0052D4,
#4364F7,
#6FB1FC);

color:white;

}



.balance h3{

color:white;

}



/* Actions */


.quick-actions{

margin-top:40px;

}



.actions{

display:grid;
grid-template-columns:repeat(3,1fr);
gap:20px;

}



.action{

background:white;
padding:30px;
text-align:center;
border-radius:15px;
box-shadow:0 5px 15px rgba(0,0,0,.08);
transition:.3s;

}



.action:hover{

transform:translateY(-8px);

}



.action a{

text-decoration:none;
color:#222;
font-weight:bold;

}



.icon{

font-size:45px;
margin-bottom:15px;

}



.footer{

margin-top:40px;
text-align:center;
color:#777;

}




@media(max-width:900px){


.container{

flex-direction:column;

}



.sidebar{

width:100%;

}



.cards,
.actions{

grid-template-columns:1fr;

}



}



</style>


</head>





<body>



<%

HttpSession sessionUser =
        request.getSession(false);


if(sessionUser == null){

    response.sendRedirect("login.jsp");

    return;

}


String userName =
        (String)sessionUser.getAttribute("userName");



Account account =
        (Account)request.getAttribute("account");



double balance = 0.0;


if(account != null){

    balance = account.getBalance();

}



Integer accountsCount =
        (Integer)request.getAttribute("accountsCount");


if(accountsCount == null){

    accountsCount = 0;

}



Integer transactionsCount =
        (Integer)request.getAttribute("transactionsCount");


if(transactionsCount == null){

    transactionsCount = 0;

}


%>





<div class="container">





<div class="sidebar">


<div class="logo">

💳 E-Wallet

</div>




<a href="AccountController?action=dashboard">

🏠 Dashboard

</a>



<a href="AccountController?action=showAccount">

🏦 My Account

</a>



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



<a href="UserController?action=profile">

👤 Profile

</a>



</div>







<div class="main">





<div class="header">


<div>


<h2>

Welcome Back,
<%=userName%> 👋

</h2>



<p>

Manage your E-Wallet easily

</p>


</div>





<a class="logout"
href="UserController?action=logOut">

Logout

</a>



</div>







<div class="cards">



<div class="card balance">


<h3>

Total Balance

</h3>


<h1>

$

<%=String.format("%.2f",balance)%>

</h1>


<p>

Available Money

</p>



</div>







<div class="card">


<h3>

Accounts

</h3>


<h1>

<%=accountsCount%>

</h1>


<p>

Registered Accounts

</p>


</div>







<div class="card">


<h3>

Transactions

</h3>


<h1>

<%=transactionsCount%>

</h1>


<p>

Completed Transactions

</p>


</div>




</div>









<div class="quick-actions">


<h2>

Quick Actions

</h2>




<div class="actions">





<div class="action">

<div class="icon">

💰

</div>


<a href="deposit.jsp">

Deposit

</a>


</div>







<div class="action">

<div class="icon">

💸

</div>


<a href="withdraw.jsp">

Withdraw

</a>


</div>







<div class="action">

<div class="icon">

🔄

</div>


<a href="transfer.jsp">

Transfer

</a>


</div>







<div class="action">

<div class="icon">

🏦

</div>


<a href="AccountController?action=showAccount">

Accounts

</a>


</div>







<div class="action">

<div class="icon">

📄

</div>


<a href="TransactionController?action=showTransactions">

Transactions

</a>


</div>







<div class="action">

<div class="icon">

➕

</div>


<a href="AccountController?action=createAccount">

Create Account

</a>


</div>





</div>


</div>







<div class="footer">


© 2026 E-Wallet Banking System


</div>





</div>






</div>

<script>


// Page Loading Animation

window.onload = function(){


    let cards =
    document.querySelectorAll(".card,.action");



    cards.forEach((card,index)=>{


        card.style.opacity="0";

        card.style.transform="translateY(30px)";



        setTimeout(function(){


            card.style.transition="0.6s";

            card.style.opacity="1";

            card.style.transform="translateY(0)";


        }, index * 150);



    });



    startCounter("balance",
    		<%=balance%>);



    startCounter("accounts",
    <%=accountsCount%>);



    startCounter("transactions",
    <%=transactionsCount%>);



};







// Confirm Logout

function confirmLogout(){


    return confirm(
        "Are you sure you want to logout?"
    );


}







// Number Animation

function startCounter(type,value){



    let element;



    if(type=="balance"){

        element =
        document.querySelector(".balance h1");


        value =
        parseFloat(value);


    }


    else if(type=="accounts"){


        element =
        document.querySelectorAll(".card h1")[1];


    }


    else{


        element =
        document.querySelectorAll(".card h1")[2];


    }





    let counter = 0;


    let speed =
    value / 50;



    let interval =
    setInterval(function(){


        counter += speed;



        if(counter >= value){


            counter=value;


            clearInterval(interval);


        }



        if(type=="balance"){


            element.innerHTML =
            "$" + counter.toFixed(2);


        }
        else{


            element.innerHTML =
            Math.floor(counter);


        }



    },20);



}







// Current Date


let footer =
document.querySelector(".footer");



let date =
new Date();



footer.innerHTML +=
"<br>Today : "
+
date.toLocaleDateString();






</script>


</body>


</html>