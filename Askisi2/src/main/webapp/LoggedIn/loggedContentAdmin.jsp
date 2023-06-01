
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Content Admin- Home</title>
    <link rel="stylesheet" href="LoggedIn/stylesheet2.css">
</head>
<body>
    <div class="full-page" id="full-page">
        <br><h1 style="font-weight: bold; font-size: 37px"> Home - Content Admin ${username}</h1>
        <ul class="menu">
            <li><a href="${pageContext.request.contextPath}/available-movies-servlet">Available Movies</a></li>
            <li><a href="${pageContext.request.contextPath}/LoggedIn/ContentAdmin/InsertMovie.jsp">Insert Movie</a></li>
            <li><a href="${pageContext.request.contextPath}/LoggedIn/ContentAdmin/InsertCinema.jsp">Insert Cinema</a></li>
            <li><a href="${pageContext.request.contextPath}/LoggedIn/ContentAdmin/InsertScreening.jsp">Insert Screening</a></li>
            <li><a href="${pageContext.request.contextPath}">Log Out</a></li>
        </ul>
    </div>
</body>
<script src="${pageContext.request.contextPath}/bgchange.js"></script>
</html>

