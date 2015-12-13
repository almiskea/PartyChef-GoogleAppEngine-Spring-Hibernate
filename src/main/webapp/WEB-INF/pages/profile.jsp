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

        <section>
            <style>
                img {
                    float: right;
                    margin: 0 25px 10px 10px;
                }
            </style>
            <nav id="nav01"></nav>
            <div id="main">
                Welcome ${sessionScope.user.username}
                <br><br>
                <a href="logoutMethod">Logout</a>

                <h1>PATRY CHEF USERS </h1>
                <h2>Web Site USERS:</h2>


                <br>
                <br>
                <form name='profile' action="profileUpdate" method="post" >  

                    <c:if test="${sessionScope.image == null}">
                        <img src="serve" height="120" width="120"/>
                    </c:if>

                    <table border="1">
                        <tr>
                            <td><label for="username">User id:</label></td>
                            <td> ${sessionScope.user.username}</td>
                        </tr><tr>
                            <td><label for="name">Name:</label></td>
                            <td> <input type="text" name="name" placeholder="${sessionScope.user.name}"/></td>
                        </tr><tr>
                            <td><label for="country">Country:</label></td>
                            <td> <input type="text" name="country" placeholder="${sessionScope.user.country}"/></td>
                        </tr><tr>
                            <td><label for="city">City:</label>
                            <td> <input type="text" name="city" placeholder="${sessionScope.user.city}"/></td>
                        </tr><tr>
                            <td><label for="state">State:</label></td>
                            <td>  <input type="text" name="state" placeholder="${sessionScope.user.state}"/></td>
                        </tr><tr>
                            <td><label for="zip">Zip:</label></td>
                            <td>  <input type="text" name="zip" placeholder="${sessionScope.user.zip}"/></td>
                        </tr><tr>
                            <td><label for="email">Email:</label></td>
                            <td> <input type="text" name="email" placeholder="${sessionScope.user.email}"/></td>
                        </tr><tr>
                            <td><label for="phone">Phone:</label></td>
                            <td> <input type="text" name="phone" placeholder="${sessionScope.user.phone}"/></td>
                        </tr><tr>
                            <td><label for="cuisine">Cuisine:</label></td>
                            <td><input type="text" name="cuisine" placeholder="${sessionScope.user.cuisine}"/></td>
                        </tr>


                    </table>
                    <input type="submit" value="update">
                </form>
                <form method="post" action="upload" enctype="multipart/form-data">
                    <table border="0">
                        <tr>
                            <td>Update/Upload profile picture:</td>
                            <td><input type="file" name="file1" size="50" /></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Upload" /></td>
                        </tr>
                    </table>
                </form>
                

                <form method="post" action="uploadRecipeImage" enctype="multipart/form-data">
                    <table border="0">
                        
                        <tr>
                            <td><input type="file" name="file1" size="50" /></td>
                            <td><input type="submit" value="Upload recepie" /></td>
                        </tr>
                    </table>
                </form>
                        
                      <img src="serveRecipeImage" height="120" width="120"/>  
                        <footer id="foot01"></footer>

            </div>
            <script src="${pageContext.request.contextPath}/pages/script.js"></script>

        </section>
    </body>
</html>

