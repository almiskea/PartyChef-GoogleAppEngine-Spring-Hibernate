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
          <a href="logoutMethod">Logout</a>
	  <h1>About Us</h1>
          <p>This website is for all people who either like to cook for others or<br>
          would like to eat homemade food from people who know how to cook but do not have restaurants.</p>
          <p>It is catering but not that official, so you can specify the maximum number of people you can cook for.</p>
          <p>Basically, if you are looking forward to invite your friends but do not want to order from restaurants,<br>
          either because they are expensive or you want to eat a homemade food, this website is for you.</p>
          <p>If you know how to cook and want to cook to other for money but you cannot own a restaurant or<br> you just want to cook for fun, then this website is for you.</p>
	  

	  <footer id="foot01"></footer>
  </div>

<script src="${pageContext.request.contextPath}/pages/script.js"></script>
</body>
</html>