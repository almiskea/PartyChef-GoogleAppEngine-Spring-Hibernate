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
                <%! 
                        UsersDao u = new UsersDao();
                        int i = 0;
                    %>
                    <%! 
                        Users user ;
                        HttpSession session;
                        String username;
                    %>
                    <%
                        username = (String)session.getAttribute("username");
                        
                        user = u.getUser(username);
                                
                    %>
                   <%
                        
                    %>
                    
                    <tr>
                        <td><% out.print(user.getUsername()); %></td>
                        <td><% out.print(user.getName()); %></td>
                        <td><% out.print(user.getCountry()); %></td>
                        <td><% out.print(user.getCity()); %></td>
                        <td><% out.print(user.getState()); %></td>
                        <td><% out.print(user.getZip()); %></td>
                        <td><% out.print(user.getEmail()); %></td>
                        <td><% out.print(user.getPhone()); %></td>
                        <td><% out.print(user.getCuisine()); %></td>
                    </tr>
                   <%
                        
                   %>
            </table>
            <p>Pages (HTML)</p>
            <p>Style Sheets (CSS)</p>
            <p>Computer Code (JavaScript)</p>
            <p>Live Data (Files and Databases)</p>
            <footer id="foot01"></footer>
  
        </div>
        <script src="${pageContext.request.contextPath}/pages/script.js"></script>
    </body>
</html>

