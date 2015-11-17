<%-- 
    Document   : Home
    Created on : Oct 18, 2015, 3:50:16 PM
    Author     : Ali
--%>

<%@page import="java.util.List"%>
<%@page import="dao.Users"%>
<%@page import="dao.UsersDao"%>
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
            Welcome ${sessionScope.username}
            <br><br>
            <a href="logoutMethod">Logout</a>

            <h1>PATRY CHEF USERS </h1>
            <h2>Web Site USERS:</h2>

            <form name='profile' action="profileUpdate" method="post" >  
                <table border="1">

                    <%!
                        UsersDao u = new UsersDao();
                        int i = 0;
                    %>
                    <%!
                        Users user;
                        HttpSession session;
                        String username;
                    %>
                    <%
                        username = (String) session.getAttribute("username");

                        user = u.getUser(username);

                    %>
                    <%
                    %>

                    <tr>
                        <td><label for="username">User id:</label>
                            <% out.print(user.getUsername()); %></td>
                    </tr><tr>
                        <td><label for="name">Name:</label>
                            <input type="text" name="name" placeholder="<% out.print(user.getName()); %>"/></td>
                    </tr><tr>
                        <td><label for="country">Country:</label>
                            <input type="text" name="country" placeholder="<% out.print(user.getCountry()); %>"/></td>
                    </tr><tr>
                        <td><label for="city">City:</label>
                            <input type="text" name="city" placeholder="<% out.print(user.getCity()); %>"/></td>
                    </tr><tr>
                        <td><label for="state">State:</label>
                            <input type="text" name="state" placeholder="<% out.print(user.getState()); %>"/></td>
                    </tr><tr>
                        <td><label for="zip">Zip:</label>
                            <input type="text" name="zip" placeholder="<% out.print(user.getZip()); %>"/></td>
                    </tr><tr>
                        <td><label for="email">Email:</label>
                            <input type="text" name="email" placeholder="<% out.print(user.getEmail()); %>"/></td>
                    </tr><tr>
                        <td><label for="phone">Phone:</label>
                            <input type="text" name="phone" placeholder="<% out.print(user.getPhone()); %>"/></td>
                    </tr><tr>
                        <td><label for="cuisine">Cuisine:</label>
                            <input type="text" name="cuisine" placeholder="<% out.print(user.getCuisine()); %>"/></td>
                    </tr>
                    <%

                    %>
                </table>
                <input type="submit" value="update">
            </form>
            <footer id="foot01"></footer>

        </div>
        <script src="${pageContext.request.contextPath}/pages/script.js"></script>
    </body>
</html>

