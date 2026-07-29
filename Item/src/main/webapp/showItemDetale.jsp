<%@page import="java.util.List"%>
<%@page import="com.item.detls.model.ItemDetales"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Item Details</title>


<style>

*{
    box-sizing:border-box;
}


body{

    font-family: 'Segoe UI', Arial, sans-serif;
    background:linear-gradient(135deg,#667eea,#764ba2);
    min-height:100vh;
    margin:0;
    padding:0;

}



.container{

    width:90%;
    margin:40px auto;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 15px 30px rgba(0,0,0,0.2);

}



h2{

    text-align:center;
    color:#333;
    margin-bottom:30px;
    font-size:32px;

}



table{

    width:100%;
    border-collapse:collapse;
    overflow:hidden;
    border-radius:10px;

}



th{

    background:#343a40;
    color:white;
    padding:15px;
    font-size:17px;

}



td{

    padding:14px;
    text-align:center;
    border-bottom:1px solid #ddd;
    color:#444;

}



tr{

    transition:0.3s;

}



tr:hover{

    background:#f1f1f1;
    transform:scale(1.01);

}



.update,
.delete{


    padding:8px 15px;
    border-radius:20px;
    color:white;
    font-size:14px;
    display:inline-block;

}



.update{

    background:#007bff;

}



.delete{

    background:#dc3545;

}



.update:hover{

    background:#0056b3;

}



.delete:hover{

    background:#a71d2a;

}



.add{


    display:inline-block;
    margin-top:25px;
    padding:12px 25px;
    background:#28a745;
    color:white;
    border-radius:25px;
    transition:0.3s;
    text-decoration:none;


}



.add:hover{

    background:#1e7e34;
    transform:translateY(-3px);

}




.back{

    margin-top:20px;
    text-align:center;

}



.back a{


    text-decoration:none;
    color:#333;
    font-weight:bold;
    font-size:18px;

}



.no-data{

    text-align:center;
    color:red;
    font-size:20px;
    padding:30px;

}



/* Mobile */

@media(max-width:700px){


table{

font-size:12px;

}


.container{

width:95%;

}


}



</style>


</head>



<body>



<div class="container">



<h2>
    📦 Item Details List
</h2>




<%

List<ItemDetales> itemDetalesList =
(List<ItemDetales>) request.getAttribute("itemDetalesData");

%>





<table>


<tr>

<th>ID</th>

<th>Item Name</th>

<th>Description</th>

<th>Date</th>

<th>Action</th>

</tr>




<%

if(itemDetalesList != null && !itemDetalesList.isEmpty()){


for(ItemDetales itemDetales : itemDetalesList){

%>



<tr>


<td>
<%=itemDetales.getId()%>
</td>



<td>
<%=itemDetales.getItemName()%>
</td>



<td>
<%=itemDetales.getDescription()%>
</td>



<td>
<%=itemDetales.getItemDate()%>
</td>



<td>


<a class="update"
href="ItemController?action=showItemDetalesById&id=<%=itemDetales.getId()%>">

✏ Update

</a>



<a class="delete"
onclick="return confirmDelete();"
href="ItemController?action=deletItemDetales&id=<%=itemDetales.getId()%>">

🗑 Delete

</a>



</td>


</tr>




<%

}

}else{


%>


<tr>

<td colspan="5" class="no-data">

❌ No Item Details Found

</td>

</tr>


<%

}

%>



</table>




<a class="add" href="add-item-detales.jsp">

➕ Add Item Details

</a>





<div class="back">


<a href="/item-serves-1/ItemController?action=showItems">

⬅ Back To Items

</a>



</div>




</div>





<script>


function confirmDelete(){


let result = confirm(
"Are you sure you want to delete this item details?"
);


return result;


}





// Add animation when page load

window.onload=function(){


let rows=document.querySelectorAll("tr");


rows.forEach((row,index)=>{


row.style.opacity="0";


setTimeout(()=>{


row.style.transition="0.5s";

row.style.opacity="1";


},index*100);



});


}



</script>



</body>


</html>