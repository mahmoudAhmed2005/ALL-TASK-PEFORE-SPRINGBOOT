<%@page import="com.item.detls.model.ItemDetales"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Update Item Details</title>


<style>


*{
    box-sizing:border-box;
}



body{

    font-family:'Segoe UI',Arial,sans-serif;
    background:linear-gradient(135deg,#667eea,#764ba2);
    min-height:100vh;
    margin:0;
    display:flex;
    justify-content:center;
    align-items:center;

}



.container{


    width:420px;
    background:white;
    padding:35px;
    border-radius:20px;
    box-shadow:0 15px 35px rgba(0,0,0,.25);


}



h2{


    text-align:center;
    color:#333;
    margin-bottom:25px;


}



label{


    display:block;
    margin-top:15px;
    font-weight:bold;
    color:#555;


}



input{


    width:100%;
    padding:12px;
    margin-top:8px;
    border:1px solid #ccc;
    border-radius:8px;
    outline:none;
    font-size:15px;


}



input:focus{


    border-color:#007bff;
    box-shadow:0 0 8px rgba(0,123,255,.4);


}



button{


    width:100%;
    margin-top:25px;
    padding:13px;
    background:#007bff;
    color:white;
    border:none;
    border-radius:25px;
    font-size:17px;
    cursor:pointer;
    transition:.3s;


}



button:hover{


    background:#0056b3;
    transform:translateY(-3px);


}



.back{


    text-align:center;
    margin-top:20px;


}



.back a{


    text-decoration:none;
    color:#333;
    font-weight:bold;


}



.error{


    color:red;
    font-size:14px;
    margin-top:5px;


}



</style>



</head>



<body>



<div class="container">



<h2>
✏ Update Item Details
</h2>




<%

ItemDetales itemDetales =
(ItemDetales) request.getAttribute("itemDetalesDate");


%>




<form action="ItemController" 
      method="post"
      onsubmit="return validateForm()">



<input type="hidden"
       name="action"
       value="updateItemDetales">





<input type="hidden"
       name="id"
       value="<%=itemDetales.getId()%>">





<label>
Description
</label>



<input type="text"
       id="description"
       name="description"
       value="<%=itemDetales.getDescription()%>"
       required>



<div id="error" class="error"></div>





<label>
Item Date
</label>



<input type="date"
       name="itemDat"
       value="<%=itemDetales.getItemDate()%>"
       required>





<label>
Item Name
</label>



<input type="text"
       name="itemName"
       value="<%=itemDetales.getItemName()%>"
       readonly>







<button type="submit">

Update Details 💾

</button>




</form>




<div class="back">


<a href="/item-serves-1/ItemController?action=showItems">

⬅ Back To Items

</a>


</div>




</div>







<script>


function validateForm(){


let desc =
document.getElementById("description").value.trim();



let error =
document.getElementById("error");



if(desc.length < 3){


error.innerHTML =
"Description must be at least 3 characters";


return false;


}



error.innerHTML="";


return true;


}



</script>





</body>

</html>