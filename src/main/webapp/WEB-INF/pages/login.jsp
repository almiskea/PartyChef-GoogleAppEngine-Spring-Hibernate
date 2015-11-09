<%-- 
    Document   : login
    Created on : Oct 18, 2015, 3:45:44 PM
    Author     : Ali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <title>LogIn Page</title>
         <link href="${pageContext.request.contextPath}/pages/site.css" rel="stylesheet">
    </head>
    <body>
        <div id="main">
            <ul id='menu'>
                    <li><a href='signUp'>SignUp</a></li>
            </ul>
        
        <font color="red">${msg}</font>
        <form action="loginMethod" method="POST">
            <input type="text" name="username" value="" /><br>
            <input type="password" name="password" value="" /><br>
            <input type="submit" value="Login" />
        </form>
        </div>
        <li><a href='EmailSend'>Forgot your password or Username?</a></li>
    </body>
</html>
