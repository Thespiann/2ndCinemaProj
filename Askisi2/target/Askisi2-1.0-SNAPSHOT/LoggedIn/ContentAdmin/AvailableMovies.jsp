<%@ page import="com.askisi2.cinema.Films"%>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Content Admin- Available Movies</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/LoggedIn/stylesheet2.css">
</head>
<body>
<div class="full-page" id="full-page">
    <h1>Available Movies</h1>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Category</th>
            <th>Description</th>
            <th>Director</th>
            <th>Length</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Films> movies = (List<Films>) request.getAttribute("Movies");
            if (movies != null && !movies.isEmpty()) {
                for (Films film : movies) {
        %>
        <tr>
            <td><%= film.getFilmId() %></td>
            <td><%= film.getFilmTitle() %></td>
            <td><%= film.getFilmCategory() %></td>
            <td><%= film.getFilmDescription() %></td>
            <td><%= film.getFilmDirector() %></td>
            <td><%= film.getFilmLength() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">No movies available.</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
<script src="${pageContext.request.contextPath}/bgchange.js"></script>
</body>
</html>
