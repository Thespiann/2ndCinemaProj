<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Content Admin- Insert Movie</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/LoggedIn/stylesheet2.css">
</head>
<body>
<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">
<div class="full-page" id="full-page">
    <br><h1> Insert Movie</h1>
        <form id="insertForm" class="form-box" style="" action="${pageContext.request.contextPath}/InsertMovieServlet" method="POST"><br>
            <input type="text" id="contentAdmin"  class="input" placeholder="Enter username" required name="username">
            <input type="text" id="title" class="input" placeholder="Enter title" required name="name">
            <input type="text" id="category" class="input" placeholder="Enter category" required name="type">
            <input type="text" id="description" class="input" placeholder="Enter description" required name="content">
            <input type="text" id="director"  class="input" placeholder="Enter director" required name="director">
            <input type="text" id="length"  class="input" placeholder="Enter length" required name="length">

            <br><br><button type="submit" class="sb">Insert Movie</button>
        </form>
</div>
<script>
    var status= document.getElementById("status").value;
    if(status== "Insert successful."){
    alert(status);
    document.getElementById("status").value = "";
    }
    if(status== "Insert failed. There is already a movie with that name registered."){
        alert(status);
        document.getElementById("status").value = "";
    }
</script>
</body>
</html>
