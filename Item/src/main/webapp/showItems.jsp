<%@page import="com.item.model.Item"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Items Dashboard</title>


<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:"Segoe UI", Arial, sans-serif;
}


body{

    min-height:100vh;

    display:flex;

    justify-content:center;

    align-items:center;

    padding:30px;


    background:
    radial-gradient(circle at top left,#2563eb,transparent 35%),
    radial-gradient(circle at bottom right,#06b6d4,transparent 35%),
    #0f172a;

}



/* Main card */

.layer{

    width:100%;

    max-width:1200px;

    background:rgba(255,255,255,0.96);

    padding:40px;

    border-radius:25px;

    box-shadow:
    0 25px 60px rgba(0,0,0,.35);

    animation:showPage .7s ease;

}



/* Title */

h1{

    text-align:center;

    margin-bottom:35px;

    font-size:38px;

    font-weight:800;


    background:
    linear-gradient(135deg,#2563eb,#06b6d4);


    -webkit-background-clip:text;

    -webkit-text-fill-color:transparent;

}



/* Table */


table{

    width:100%;

    border-collapse:separate;

    border-spacing:0;

    overflow:hidden;

    border-radius:18px;

    box-shadow:
    0 10px 30px rgba(0,0,0,.12);

}



/* Header */

thead{

    background:
    linear-gradient(135deg,#2563eb,#06b6d4);

}



thead th{

    padding:18px;

    color:white;

    font-size:14px;

    text-transform:uppercase;

    letter-spacing:1px;

}



/* Rows */


tbody tr{

    background:white;

    transition:.3s;

    animation:rowAnimation .5s ease forwards;

    opacity:0;

}



tbody tr:nth-child(even){

    background:#f8fafc;

}



tbody tr:hover{

    transform:translateY(-3px);

    box-shadow:
    0 10px 25px rgba(0,0,0,.15);

}



tbody td{

    padding:18px;

    text-align:center;

    color:#334155;

    border-bottom:1px solid #e2e8f0;

}



td strong{

    color:#2563eb;

}



/* Action buttons */


td a{

    display:inline-block;

    padding:9px 18px;

    margin:5px;

    border-radius:25px;

    color:white;

    text-decoration:none;

    font-size:13px;

    font-weight:700;

    transition:.3s;

}



.update-btn{

    background:
    linear-gradient(135deg,#22c55e,#16a34a);

}



.delete-btn{

    background:
    linear-gradient(135deg,#ef4444,#f97316);

}



td a:hover{

    transform:translateY(-3px);

    box-shadow:
    0 8px 20px rgba(0,0,0,.2);

}



/* Bottom buttons */


.buttons{

    display:flex;

    justify-content:center;

    gap:20px;

    margin-top:35px;

}



.buttons a{


    padding:15px 35px;

    border-radius:30px;

    text-decoration:none;

    color:white;

    font-weight:700;

    transition:.3s;

}



.add-btn{

    background:
    linear-gradient(135deg,#2563eb,#06b6d4);

}



.logout-btn{

    background:
    linear-gradient(135deg,#ef4444,#f97316);

}



.buttons a:hover{

    transform:translateY(-3px);

    box-shadow:
    0 10px 25px rgba(0,0,0,.25);

}



/* Empty */

.empty-message{

    width:500px;

    padding:50px;

    background:white;

    border-radius:25px;

    text-align:center;

    margin:auto;

    box-shadow:
    0 20px 50px rgba(0,0,0,.25);

}



.empty-message h1{

    font-size:35px;

}



.empty-message p{

    color:#64748b;

    margin-top:15px;

}



/* Animations */


@keyframes showPage{

from{

opacity:0;

transform:translateY(40px);

}


to{

opacity:1;

transform:translateY(0);

}

}



@keyframes rowAnimation{


from{

opacity:0;

transform:translateY(20px);

}


to{

opacity:1;

transform:translateY(0);

}


}



/* Mobile */

@media(max-width:700px){

.layer{

padding:20px;

}


table{

display:block;

overflow-x:auto;

}


.buttons{

flex-direction:column;

}


.buttons a{

text-align:center;

}

}

.user-btn{

    background:
    linear-gradient(135deg,#8b5cf6,#6366f1);

}

.details-btn{
    background:
    linear-gradient(135deg,#f59e0b,#eab308);
}



</style>

</head>


<body>

<%

List<Item> items = (List<Item>) request.getAttribute("itemsData");


if(items == null || items.isEmpty()){

%>


<div class="empty-message">

    <h1>No Items Found</h1>

    <p>
        Please add a new item
    </p>


    <br>


    <div class="buttons">

        <a class="add-btn"
           href="/item-serves-1/add-item.html">

            + Add Item

        </a>

    </div>


</div>


<%

return;

}

%>



<div class="layer">


<h1>
    Items Dashboard
</h1>



<table>


<thead>

<tr>

<th>ID</th>

<th>Name</th>

<th>Price</th>

<th>Total Number</th>

<th>Action</th>

<th>Details</th>

</tr>


</thead>



<tbody>



<%

int count = 0;

for(Item item : items){

%>


<tr style="animation-delay:<%=count * 0.1%>s">


<td>

<strong>
<%= item.getId() %>
</strong>

</td>



<td>

<%= item.getName() %>

</td>



<td>

€ <%= item.getPrice() %>

</td>



<td>

<%= item.getTotalNumber() %>

</td>



<td>


<a class="update-btn"

href="/item-serves-1/ItemController?action=showItem&id=<%= item.getId() %>">

Update

</a>



<a class="delete-btn"

onclick="return confirmDelete()"

href="/item-serves-1/ItemController?action=deleteItem&id=<%= item.getId() %>">


Delete

</a>


</td>




    




<td>
<%
Boolean hasDetailsObj = (Boolean) request.getAttribute("hasDetails_" + item.getName());
        


boolean hasDetails = hasDetailsObj != null && hasDetailsObj;
%>


<% if(hasDetails){ %>

<a class="details-btn"
href="/item-serves-1/ItemController?action=showItemDetales&name=<%=item.getName()%>">

Show Item Details

</a>

<% }else{ %>

<a class="details-btn"
href="/item-serves-1/ItemController?action=showAddItemDetales&name=<%=item.getName()%>">

Add Item Details

</a>

<% } %>

</td>


<%

count++;

}

%>


</tbody>


</table>





<div class="buttons">


<a class="add-btn"

href="/item-serves-1/add-item.html">

+ Add Item

</a>



<a class="logout-btn"

id="logout"

href="/item-serves-1/UserController?action=logOut">

Logout

</a>


<a class="user-btn"

href="/item-serves-1/ItemController?action=showForUser">

View User Items

</a>





</div>



</div>





<script>


// Delete confirmation

function confirmDelete(){


    return confirm(
        "Are you sure you want to delete this item?"
    );


}




// Loading animation

const links =
document.querySelectorAll("a");



links.forEach(link=>{


    link.addEventListener("click",function(){


        if(
            !this.classList.contains("delete-btn")
        ){


            this.style.opacity="0.6";

            this.innerHTML="Loading...";


        }


    });


});





// Prevent double submit

let clicked=false;


document.querySelectorAll("a")
.forEach(btn=>{


btn.addEventListener("click",()=>{


    if(clicked){

        event.preventDefault();

    }


    clicked=true;


});


});



</script>



</body>

</html>