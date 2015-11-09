<%-- 
    Document   : index
    Created on : Nov 4, 2015, 12:45:20 AM
    Author     : Ali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <title>Our Company</title>
  <link href="${pageContext.request.contextPath}/pages/site.css" rel="stylesheet">
</head>

<body>

	<ul id='menu'>
		<li><a href='login'>Login</a></li>
		<li><a href='signUp'>Signup</a></li>
	</ul>
 <!-- <nav id="nav01"></nav> -->

  <div id="main">
	  <h1>Welcome to Our Company</h1>
	  <h2>Web Site Main Ingredients:</h2>

	  <p>Pages (HTML)</p>
	  <p>Style Sheets (CSS)</p>
	  <p>Computer Code (JavaScript)</p>
	  <p>Live Data (Files and Databases)</p>
	  <footer id="foot01"></footer>
  </div>
  
  <script src="${pageContext.request.contextPath}/pages/script.js"></script>
</body>
</html>