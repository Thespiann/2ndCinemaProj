<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Content Admin-Insert Cinema</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/LoggedIn/stylesheet2.css">
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">
<div class="full-page" id="full-page">
    <br><h1> Insert Cinema</h1>
    <form id="insertForm" class="form-box" action="${pageContext.request.contextPath}/InsertCinemaServlet" method="POST"><br><br><br>
        <input type="text" id="id"  class="input" placeholder="Enter ID(consists only of numbers)" required name="id">
        <input type="text" id="name" class="input" placeholder="Enter Cinema name" required name="name">
        <input type="text" id="seats" class="input" placeholder="Enter number of seats" required name="seats">
        <input type="text" id="is3D" class="input" placeholder="Enter yes/no for whether cinema is 3D " required name="is3D">

        <br><br><button type="submit" class="sb">Insert Cinema</button>
    </form>
</div>
<script>
    var status= document.getElementById("status").value;
    if(status== "Insert successful."){
        alert(status);
        document.getElementById("status").value = "";
    }
    if(status== "Insert failed. There is already a cinema with that id registered."){
        alert(status);
        document.getElementById("status").value = "";
    }
</script>
</body>
</html>
