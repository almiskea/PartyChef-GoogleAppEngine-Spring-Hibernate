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

            <form name='profile' action="profileUpdate" method="post" >  
                <table border="1">

                    <tr>
                        <td><label for="username">User id:</label>
                            ${sessionScope.user.username}</td>
                    </tr><tr>
                        <td><label for="name">Name:</label>
                            <input type="text" name="name" placeholder="${sessionScope.user.name}"/></td>
                    </tr><tr>
                        <td><label for="country">Country:</label>
                            <input type="text" name="country" placeholder="${sessionScope.user.country}"/></td>
                    </tr><tr>
                        <td><label for="city">City:</label>
                            <input type="text" name="city" placeholder="${sessionScope.user.city}"/></td>
                    </tr><tr>
                        <td><label for="state">State:</label>
                            <input type="text" name="state" placeholder="${sessionScope.user.state}"/></td>
                    </tr><tr>
                        <td><label for="zip">Zip:</label>
                            <input type="text" name="zip" placeholder="${sessionScope.user.zip}"/></td>
                    </tr><tr>
                        <td><label for="email">Email:</label>
                            <input type="text" name="email" placeholder="${sessionScope.user.email}"/></td>
                    </tr><tr>
                        <td><label for="phone">Phone:</label>
                            <input type="text" name="phone" placeholder="${sessionScope.user.phone}"/></td>
                    </tr><tr>
                        <td><label for="cuisine">Cuisine:</label>
                            <input type="text" name="cuisine" placeholder="${sessionScope.user.cuisine}"/></td>
                    </tr>
                    
                </table>
                <input type="submit" value="update">
            </form>
            <footer id="foot01"></footer>

        </div>
        <script src="${pageContext.request.contextPath}/pages/script.js"></script>
    </body>
</html>

