<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Content Admin-Insert Screening</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/LoggedIn/stylesheet2.css">
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">
<div class="full-page" id="full-page">
    <br><h1> Insert Cinema</h1>
    <form id="insertForm" class="form-box" action="${pageContext.request.contextPath}/InsertScreeningServlet" method="POST"><br><br><br>
        <input type="text" id="username" class="input" placeholder="Enter username" required name="username">
        <input type="text" id="movies_name"  class="input" placeholder="Enter Movie's Name" required name="movies_name">
        <input type="text" id="cinemas_id" class="input" placeholder="Enter Cinema's ID" required name="cinemas_id">
        <input type="text" id="time_date" class="input" placeholder="Enter time and date " required name="time_date">
        <input type="text" id="id" class="input" placeholder="Enter ID" required name="id">


        <br><br><button type="submit" class="sb">Insert Cinema</button>
    </form>
</div>
<script>
    var status= document.getElementById("status").value;
    if(status== "Insert successful."){
        alert(status);
        document.getElementById("status").value = "";
    }
    if(status== "Insert failed. There is no cinema with that ID registered."){
        alert(status);
        document.getElementById("status").value = "";
    }
    if(status== "Insert failed. There is no movie with that name registered."){
        alert(status);
        document.getElementById("status").value = "";
    }
    if(status== "Insert failed. There is already a screening with that id registered."){
        alert(status);
        document.getElementById("status").value = "";
    }
    if(status== "Insert failed. There is no such username for a content admin."){
        alert(status);
        document.getElementById("status").value = "";
    }

</script>
</body>
</html>
