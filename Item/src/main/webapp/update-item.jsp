<%@page import="com.item.model.Item"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Update Item</title>


<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:"Segoe UI",Arial,sans-serif;
}



body{

    min-height:100vh;

    display:flex;

    justify-content:center;

    align-items:center;

    padding:20px;


    background:
    radial-gradient(circle at top left,#2563eb,transparent 35%),
    radial-gradient(circle at bottom right,#06b6d4,transparent 35%),
    #0f172a;

}



/* Card */


.container{

    width:100%;

    max-width:500px;

    background:white;

    padding:40px;

    border-radius:25px;

    box-shadow:
    0 25px 60px rgba(0,0,0,.35);


    animation:show .7s ease;

}



.title{

    text-align:center;

    font-size:35px;

    font-weight:800;

    margin-bottom:30px;


    background:
    linear-gradient(135deg,#2563eb,#06b6d4);


    -webkit-background-clip:text;

    -webkit-text-fill-color:transparent;

}



/* Inputs */


.input-group{

    margin-bottom:25px;

}



.input-group label{

    display:block;

    margin-bottom:8px;

    font-weight:600;

    color:#334155;

}



.input-group input{


    width:100%;

    padding:14px;

    border-radius:12px;

    border:1px solid #cbd5e1;

    background:#f8fafc;

    font-size:15px;

    outline:none;

    transition:.3s;

}



.input-group input:focus{

    border-color:#2563eb;

    background:white;

    box-shadow:
    0 0 0 4px rgba(37,99,235,.15);

}



.input-group input.invalid{

    border-color:#ef4444;

}



.error{

    color:#ef4444;

    font-size:13px;

    display:none;

    margin-top:5px;

}



/* Button */


.button{

    width:100%;

    padding:15px;

    border:none;

    border-radius:30px;

    cursor:pointer;

    color:white;

    font-size:17px;

    font-weight:700;


    background:
    linear-gradient(135deg,#2563eb,#06b6d4);


    transition:.3s;

}



.button:hover{

    transform:translateY(-3px);

    box-shadow:
    0 12px 25px rgba(37,99,235,.4);

}



.button.loading{

    opacity:.7;

    pointer-events:none;

}



/* Back */


.back{

    text-align:center;

    margin-top:25px;

}



.back a{

    text-decoration:none;

    color:#2563eb;

    font-weight:700;

}



.back a:hover{

    text-decoration:underline;

}



@keyframes show{


from{

opacity:0;

transform:translateY(40px);

}


to{

opacity:1;

transform:translateY(0);

}


}


</style>


</head>


<body>


<%

Item item =
(Item)request.getAttribute("itemData");

%>



<div class="container">


<div class="title">

Update Item

</div>



<form id="updateForm"
action="/item-serves-1/ItemController"
method="post">



<div class="input-group">

<label>Name</label>

<input
type="text"
name="name"
id="name"
value="<%=item.getName()%>"
required>

</div>




<div class="input-group">

<label>Price</label>

<input
type="number"
step="0.01"
name="price"
id="price"
value="<%=item.getPrice()%>"
required>


<p class="error" id="priceError">

Price must be greater than 0

</p>


</div>





<div class="input-group">

<label>Total Number</label>

<input
type="number"
name="totalNumber"
id="totalNumber"
value="<%=item.getTotalNumber()%>"
required>


<p class="error" id="numberError">

Total number must be greater than 0

</p>


</div>




<input
type="hidden"
name="id"
value="<%=item.getId()%>">


<input
type="hidden" name="action" value="updateItem">





<button
class="button"
id="updateBtn"
type="submit">

Update Item

</button>



</form>



<div class="back">

<a href="/item-serves-1/ItemController?action=showItems">

← Back To Items

</a>

</div>



</div>




<script>


const form =
document.getElementById("updateForm");


const price =
document.getElementById("price");


const number =
document.getElementById("totalNumber");


const priceError =
document.getElementById("priceError");


const numberError =
document.getElementById("numberError");


const button =
document.getElementById("updateBtn");



form.addEventListener("submit",function(e){



let valid=true;



if(Number(price.value)<=0){


priceError.style.display="block";

price.classList.add("invalid");

valid=false;


}else{


priceError.style.display="none";

price.classList.remove("invalid");


}




if(Number(number.value)<=0){


numberError.style.display="block";

number.classList.add("invalid");

valid=false;


}else{


numberError.style.display="none";

number.classList.remove("invalid");


}



if(!valid){


e.preventDefault();

return;


}



let confirmUpdate =
confirm("Are you sure you want to update this item?");


if(!confirmUpdate){


e.preventDefault();

return;


}



button.classList.add("loading");

button.innerHTML="Updating...";



});



</script>


</body>

</html>