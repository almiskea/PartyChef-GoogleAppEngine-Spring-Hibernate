<%-- 
    Document   : displayImage
    Created on : Nov 24, 2015, 4:38:06 PM
    Author     : Ali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Display Image</h1>
        
        
        
         <form action="serve">
            <table border="0">
                <tr>
                    <img src="serve"/>
                    <input type="text" name="id"/>
                    <td colspan="2" align="center"><input type="submit" value="show" /></td>
                </tr>
            </table>
        </form>

    </body>
</html>
