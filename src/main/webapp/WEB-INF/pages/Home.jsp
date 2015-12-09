<%-- 
    Document   : Home
    Created on : Oct 18, 2015, 3:50:16 PM
    Author     : Ali
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="js/script.js"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Our Company</title>
        <link href="${pageContext.request.contextPath}/pages/site.css" rel="stylesheet" type="text/css" />


    </head>
    <body>
        

        <nav id="nav01"></nav>
        <div id="main">
            Welcome ${sessionScope.user.username}
            <br><br>
            <a href="logoutMethod">Logout</a>

            <h1>PATRY CHEF USERS </h1>
            <h2>Web Site USERS:</h2>
            <table border="1">
                <tr>
                    <td>USER_ID</td>
                    <td>NAME</td>
                    <td>COUNTRY</td>
                    <td>CITY</td>
                    <td>STATE</td>
                    <td>ZIP</td>
                    <td>EMAIL</td>
                    <td>PHONE</td>
                    <td>CUISINE</td>
                </tr>

                <c:forEach items="${sessionScope.UList}" var="element"> 
                    <tr>
                        <td>${element.username}</td>
                        <td>${element.name}</td>
                        <td>${element.country}</td>
                        <td>${element.city}</td>
                        <td>${element.state}</td>
                        <td>${element.zip}</td>
                        <td>${element.email}</td>
                        <td>${element.phone}</td>
                        <td>${element.cuisine}</td>
                    </tr>
                </c:forEach>


                
                
            </table>

            <footer id="foot01"></footer>

        </div>
        <script src="${pageContext.request.contextPath}/pages/script.js"></script>
        
    </body>

</html>

