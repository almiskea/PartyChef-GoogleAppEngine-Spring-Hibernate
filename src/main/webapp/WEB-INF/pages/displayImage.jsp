<%-- 
    Document   : displayImage
    Created on : Nov 24, 2015, 4:38:06 PM
    Author     : Ali
--%>

<%@page import="java.io.InputStream"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.google.appengine.api.datastore.Blob"%>
<%@page import="dao.MyImageDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Display Image</h1>
        
        <img src="serve"/>
        
         <form action="serve">
            <table border="0">
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="show" /></td>
                </tr>
            </table>
        </form>

    </body>
</html>
