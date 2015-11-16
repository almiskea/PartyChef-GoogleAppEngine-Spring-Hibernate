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
                        List<Users> UList ;
                    %>
                    <%
                        UList = u.getUsers();
                    %>
                   <%
                        for(i = 0;i < UList.size();i++){
                    %>
                    
                    <tr>
                        <td><% out.print(UList.get(i).getUsername()); %></td>
                        <td><% out.print(UList.get(i).getName()); %></td>
                        <td><% out.print(UList.get(i).getCountry()); %></td>
                        <td><% out.print(UList.get(i).getCity()); %></td>
                        <td><% out.print(UList.get(i).getState()); %></td>
                        <td><% out.print(UList.get(i).getZip()); %></td>
                        <td><% out.print(UList.get(i).getEmail()); %></td>
                        <td><% out.print(UList.get(i).getPhone()); %></td>
                        <td><% out.print(UList.get(i).getCuisine()); %></td>
                    </tr>
                   <%
                        }
                   %>
            </table>
            
  
        </div>
        <script src="${pageContext.request.contextPath}/pages/script.js"></script>
    </body>
</html>

