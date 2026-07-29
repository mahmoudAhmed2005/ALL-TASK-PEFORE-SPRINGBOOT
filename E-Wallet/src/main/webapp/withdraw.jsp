<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<html>


<head>


<title>
Withdraw Money
</title>



<style>


body{

    font-family:Arial, sans-serif;
    background:#f4f7fb;
    margin:0;
    padding:0;

}



h2{

    margin-top:40px;
    color:#2c3e50;

}



.withdraw-box{


    width:380px;
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

    padding:15px;

}



label{

    font-weight:bold;
    color:#34495e;

}



input{


    width:95%;
    padding:10px;
    border-radius:8px;
    border:1px solid #ccc;
    font-size:15px;


}



input:focus{


    outline:none;
    border-color:#e67e22;
    box-shadow:0 0 5px #e67e22;


}





button{


    background:#e67e22;
    color:white;
    border:none;
    padding:12px 35px;
    border-radius:8px;
    cursor:pointer;
    font-size:16px;


}



button:hover{


    background:#d35400;
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



.error{


    text-align:center;
    color:red;
    font-weight:bold;

}



</style>



</head>




<body>





<h2 align="center">

Withdraw Money

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









<div class="withdraw-box">



<form action="AccountController" 
method="post"
onsubmit="return validateWithdraw()">





<input type="hidden"
name="action"
value="withdraw">







<table>



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


Withdraw Money


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



function validateWithdraw(){


    let amount =
    document.getElementById("amount").value;



    if(amount <= 0){


        alert("Amount must be greater than zero");


        return false;

    }





    return confirm(
        "Are you sure you want to withdraw "
        + amount
        + "?"
    );


}






window.onload=function(){


    let box =
    document.querySelector(".withdraw-box");



    box.style.opacity=0;



    setTimeout(function(){


        box.style.transition="1s";
        box.style.opacity=1;



    },200);



}



</script>






</body>


</html>