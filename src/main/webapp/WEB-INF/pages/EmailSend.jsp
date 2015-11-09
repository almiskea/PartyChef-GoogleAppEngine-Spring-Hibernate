<%-- 
    Document   : login
    Created on : Oct 18, 2015, 3:45:44 PM
    Author     : Ali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Email with Spring MVC</title>
</head>
<body>
    <center>
        <h1>Sending e-mail with Spring MVC</h1>
        <form method="post" action="sendEmail.do">
            <table border="0" width="80%">
                <tr>
                    <font color="red">${error}</font>
                    <td>Enter your email address</td>
                    <td><input type="text" name="email" size="65" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Send E-mail" />
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>