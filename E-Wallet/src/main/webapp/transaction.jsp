<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="java.util.List" %>
<%@ page import="com.transaction.model.Transaction" %>


<html>

<head>

<title>
Transaction History
</title>


<style>


body{

    font-family: Arial, sans-serif;
    background-color:#f4f7fb;
    margin:0;
    padding:0;

}



h2{

    color:#2c3e50;
    margin-top:30px;

}



table{

    width:80%;
    border-collapse:collapse;
    margin-top:30px;
    background:white;
    box-shadow:0 5px 15px rgba(0,0,0,0.1);

}



th{

    background:#3498db;
    color:white;
    padding:12px;
    text-align:center;

}



td{

    padding:10px;
    text-align:center;
    border-bottom:1px solid #ddd;

}



tr:hover{

    background:#f1f9ff;
    transition:0.3s;

}



.no-data{

    text-align:center;
    color:#e74c3c;
    font-size:20px;
    margin-top:40px;

}



a{

    text-decoration:none;
    color:white;
    background:#3498db;
    padding:10px 20px;
    border-radius:8px;
    margin:10px;
    display:inline-block;

}



a:hover{

    background:#2980b9;
    transform:scale(1.05);
    transition:0.3s;

}



.container{

    text-align:center;

}



.search-box{

    width:300px;
    padding:10px;
    margin-top:20px;
    border:1px solid #ccc;
    border-radius:8px;

}



</style>


</head>



<body>



<h2 align="center">
Transaction History
</h2>



<div class="container">


<input 
type="text" 
id="searchInput"
class="search-box"
placeholder="Search Transaction Type..."
onkeyup="searchTransaction()">



<%


List<Transaction> transactions =
(List<Transaction>) request.getAttribute("transactions");



if(transactions == null || transactions.isEmpty()){


%>


<h3 class="no-data">
No Transactions Found
</h3>



<%

}else{

%>





<table id="transactionTable">


<tr>

<th>
ID
</th>


<th>
Type
</th>


<th>
Amount
</th>


<th>
Description
</th>


<th>
Transaction Date
</th>


<th>
Status
</th>


</tr>




<%


for(Transaction transaction : transactions){


%>




<tr>


<td>

<%= transaction.getId() %>

</td>



<td class="type">

<%= transaction.getType() %>

</td>



<td>

<%= transaction.getAmount() %>

</td>



<td>

<%= transaction.getDescription() %>

</td>



<td>

<%= transaction.getTransactionDate() %>

</td>



<td>

<%= transaction.getStatus() %>

</td>



</tr>



<%

}

%>



</table>



<%

}

%>




<br><br>



<a href="AccountController?action=showAccount"
onclick="return confirmBack();">

Back To Account

</a>




<a href="AccountController?action=dashboard">

Back To Main

</a>



</div>





<script>


// Search transaction by type

function searchTransaction(){


    let input =
    document.getElementById("searchInput").value.toUpperCase();


    let table =
    document.getElementById("transactionTable");


    if(table == null)
        return;



    let rows =
    table.getElementsByTagName("tr");



    for(let i=1;i<rows.length;i++){


        let type =
        rows[i].getElementsByClassName("type")[0];



        if(type){


            let text =
            type.textContent || type.innerText;



            if(text.toUpperCase().indexOf(input)>-1){

                rows[i].style.display="";

            }
            else{

                rows[i].style.display="none";

            }


        }


    }


}




// confirm before leaving page

function confirmBack(){


    return confirm("Are you sure you want to go back to your account?");


}




// page load animation

window.onload=function(){


    let table =
    document.getElementById("transactionTable");


    if(table){


        table.style.opacity=0;


        setTimeout(function(){


            table.style.transition="1s";
            table.style.opacity=1;


        },200);


    }


}



</script>




</body>


</html>