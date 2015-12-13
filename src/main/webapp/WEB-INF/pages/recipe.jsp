<%-- 
    Document   : recipe
    Created on : Dec 11, 2015, 3:42:17 PM
    Author     : Ali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link href="${pageContext.request.contextPath}/pages/site.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <div id="main">
    <body>
        <form method="post" action="uploadRecipe" >
            <table border="0">

                <tr>

                    <td><input type="text" name="meal" size="12" /></td>
                    <td><input type="text" name="description" size="12" /></td>
                    <td><input type="submit" value="Upload recepie" /></td>
                </tr>
            </table>
        </form>
    </body>
    </div>
</html>
