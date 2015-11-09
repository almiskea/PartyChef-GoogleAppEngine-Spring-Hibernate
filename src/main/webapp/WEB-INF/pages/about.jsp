<%-- 
    Document   : about
    Created on : Oct 18, 2015, 3:44:42 PM
    Author     : Ali
--%>

<!DOCTYPE html>
<html>

<head>
  <title>About</title>
  <link href="${pageContext.request.contextPath}/pages/site.css" rel="stylesheet" type="text/css" />
</head>

<body>

  <nav id="nav01"></nav>
  
  <div id="main">
          Welcome ${sessionScope.username}
          <br><br>
          <a href="LogoutServlet.do">Logout</a>
	  <h1>About Us</h1>
	  <p>Lorem Ipsum Porem Lorem Ipsum Porem</p>
	  <footer id="foot01"></footer>
  </div>

<script src="${pageContext.request.contextPath}/pages/script.js"></script>
</body>
</html>