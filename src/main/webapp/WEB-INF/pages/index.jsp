<%-- 
    Document   : Home
    Created on : Oct 18, 2015, 3:50:16 PM
    Author     : Ali
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/onsen/onsenui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/onsen/onsentheme.css">

    <script src="${pageContext.request.contextPath}/pages/onsen/angular.js"></script>
    <script src="${pageContext.request.contextPath}/pages/onsen/onsenui.js"></script>
    <script>
      ons.bootstrap();
    </script>
  </head>
  </head>
  <body>
      <ons-navigator var="myNavigator"></ons-navigator>
<script>
function goTo(page){
    document.location.href = page;
}
</script>
    <ons-page>
      <ons-toolbar>
        <div class="center">Log In</div>
        <div class="right" ><ons-toolbar-button onclick="goTo('signUp');">Sign Up</ons-toolbar-button></div>
      </ons-toolbar>

      <div class="login-form" >
          <font color="red">${msg}</font>
          <form action="loginMethod" method="POST">
          <input type="username" name="username" class="text-input--underbar" placeholder="User" value=""><br>
        <input type="password" name="password" class="text-input--underbar" placeholder="Password" value="">
        <br><br>
        <ons-button style="background:none;" modifier="large" class="login-button" type="submit"><input type="submit" value="Login" style="height:100%; width:100%" color="blue"/></ons-button>
          </form>
        <br><br>
        <ons-button modifier="quiet" class="forgot-password" size href='EmailSend'>Forgot password?</ons-button>
      </div>

    </ons-page>
    <!--body>
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
    </body-->
</html>
