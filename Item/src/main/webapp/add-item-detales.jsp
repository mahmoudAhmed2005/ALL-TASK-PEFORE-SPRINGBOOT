<%@page import="com.item.model.Item"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Add Item Details</title>


<style>

*{
    box-sizing:border-box;
}


body{

    font-family:'Segoe UI',Arial,sans-serif;

    background:
    linear-gradient(135deg,#667eea,#764ba2);

    min-height:100vh;

    margin:0;

    display:flex;

    justify-content:center;

    align-items:center;

}



.form-container{


    width:420px;

    background:white;

    padding:35px;

    border-radius:20px;

    box-shadow:
    0 15px 35px rgba(0,0,0,0.25);

}



h2{

    text-align:center;

    color:#333;

    margin-bottom:25px;

    font-size:30px;

}



label{

    display:block;

    margin-top:15px;

    color:#555;

    font-weight:bold;

}



input,
textarea,
select{


    width:100%;

    padding:12px;

    margin-top:8px;

    border:1px solid #ccc;

    border-radius:8px;

    outline:none;

    font-size:15px;

    transition:.3s;

}



input:focus,
textarea:focus,
select:focus{


    border-color:#667eea;

    box-shadow:
    0 0 8px rgba(102,126,234,.5);

}



textarea{

    min-height:120px;

    resize:vertical;

}



button{


    width:100%;

    padding:13px;

    margin-top:25px;

    background:#28a745;

    color:white;

    border:none;

    border-radius:25px;

    font-size:17px;

    cursor:pointer;

    transition:.3s;

}



button:hover{

    background:#1e7e34;

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



<div class="form-container">



<h2>
➕ Add Item Details
</h2>




<form action="/item-serves-1/ItemController"
      method="post"
      onsubmit="return validateForm()">



<input type="hidden"
       name="action"
       value="addItemDetales">



<label>
Description
</label>


<textarea

id="description"

name="description"

placeholder="Enter description"

></textarea>


<div id="descError" class="error"></div>




<label>
Item Date
</label>


<input type="date"

name="itemDate"

required>





<label>
Item Name
</label>



       <select name="itemName" required>


     <option value="">
     -- Select Item --
    </option>



 <%


 List<Item> items = (List<Item>) request.getAttribute("itemsData");




if(items != null){


for(Item item : items){



%>


<option 

value="<%=item.getName()%>"



<%


String selectedItem = (String)request.getAttribute("itemName");



if(selectedItem != null && selectedItem.equals(item.getName())){



%>


selected


<%

}

%>



>


<%=item.getName()%>


</option>



<%


}

}


%>


</select>






<button type="submit">

Save Details 💾

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


let description =

document.getElementById("description").value.trim();



let error =

document.getElementById("descError");



if(description.length < 3){


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