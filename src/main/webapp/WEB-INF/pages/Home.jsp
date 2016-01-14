<%-- 
    Document   : Home
    Created on : Oct 18, 2015, 3:50:16 PM
    Author     : Ali
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/onsen/onsenui.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/onsen/onsentheme.css">

        <script src="${pageContext.request.contextPath}/pages/onsen/angular.min.js"></script>
        <script src="${pageContext.request.contextPath}/pages/onsen/onsenui.min.js"></script>
        <link href="${pageContext.request.contextPath}/pages/site.css" rel="stylesheet" type="text/css" />
        <script>
            ons.bootstrap();
        </script>
    </head>
    <body>
    <ons-page>
        <nav id="nav01"></nav>
        <div id="main">

        <div style="padding: 10px 9px">
            <ons-toolbar>
                <div class="center"> Welcome ${sessionScope.user.username}</div>
            </ons-toolbar>
            <ons-button  modifier="large" style="margin: 0 auto;">
                <a href='logoutMethod'>Logout</a>
            </ons-button>
        </div>
        <!--ons-list-header>PATRY CHEF USERS</ons-list-header-->
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
        <script src="${pageContext.request.contextPath}/pages/script.js"></script>
        </div>
    </ons-page>
</body>

</html>

