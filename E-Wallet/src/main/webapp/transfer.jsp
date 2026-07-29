<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html>

<head>

<title>
Transfer Money
</title>



<style>


body{

    font-family: Arial, sans-serif;
    background:#f4f7fb;
    margin:0;
    padding:0;

}



h2{

    margin-top:40px;
    color:#2c3e50;

}



.error{

    color:#e74c3c;
    text-align:center;
    font-size:18px;
    font-weight:bold;

}



.transfer-box{

    width:400px;
    margin:30px auto;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 5px 20px rgba(0,0,0,0.15);

}



table{

    width:100%;

}



td{

    padding:12px;

}



label{

    font-weight:bold;
    color:#34495e;

}



input{

    width:95%;
    padding:10px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:15px;

}



input:focus{

    border-color:#3498db;
    outline:none;
    box-shadow:0 0 5px #3498db;

}



button{

    background:#27ae60;
    color:white;
    border:none;
    padding:12px 30px;
    border-radius:8px;
    cursor:pointer;
    font-size:16px;

}



button:hover{

    background:#219150;
    transform:scale(1.05);
    transition:0.3s;

}



a{

    text-decoration:none;
    background:#3498db;
    color:white;
    padding:10px 20px;
    border-radius:8px;
    display:inline-block;

}



a:hover{

    background:#2980b9;

}



.container{

    text-align:center;

}



</style>



</head>



<body>



<h2 align="center">
Transfer Money
</h2>




<%


String error = (String)request.getAttribute("error");


if(error != null){


%>



<h3 class="error">

<%= error %>

</h3>



<%

}

%>






<div class="transfer-box">


<form action="AccountController" 
method="post"
onsubmit="return validateTransfer()">



<input type="hidden"
name="action"
value="transfer">






<table>



<tr>

<td>

<label>
To Username
</label>

</td>


<td>


<input type="text"
id="toUserName"
name="toUserName"
placeholder="Enter username"
required>


</td>


</tr>







<tr>


<td>

<label>
Amount
</label>

</td>



<td>


<input type="number"
id="amount"
name="amount"
step="0.01"
min="1"
placeholder="Enter amount"
required>


</td>


</tr>







<tr>


<td colspan="2" align="center">


<button type="submit">

Transfer Money

</button>


</td>


</tr>





</table>



</form>



</div>







<div class="container">



<a href="AccountController?action=dashboard">

Back To Main

</a>



<br><br>



<a href="AccountController?action=showAccount">

Show Account

</a>




</div>








<script>


function validateTransfer(){


    let username =
    document.getElementById("toUserName").value.trim();



    let amount =
    document.getElementById("amount").value;



    if(username.length < 3){


        alert("Username must be at least 3 characters");


        return false;

    }




    if(amount <= 0){


        alert("Amount must be greater than zero");


        return false;

    }





    let confirmTransfer =
    confirm(
    "Are you sure you want to transfer " 
    + amount 
    + " money to " 
    + username 
    + "?"
    );



    return confirmTransfer;


}





window.onload=function(){


    document.querySelector(".transfer-box")
    .style.opacity=0;



    setTimeout(function(){


        document.querySelector(".transfer-box")
        .style.transition="1s";

        document.querySelector(".transfer-box")
        .style.opacity=1;


    },200);


}



</script>





</body>


</html>