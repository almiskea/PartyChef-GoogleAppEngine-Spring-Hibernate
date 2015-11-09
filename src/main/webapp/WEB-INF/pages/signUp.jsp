<%-- 
    Document   : signUp
    Created on : Oct 18, 2015, 3:46:24 PM
    Author     : Ali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>  
<html lang="en"><head>  
<meta charset="utf-8">  
<title>JavaScript Form Validation using a sample registration form</title>  
<meta name="keywords" content="example, JavaScript Form Validation, Sample registration form" />  
<meta name="description" content="This document is an example of JavaScript Form Validation using a sample registration form. " />  
<link rel='stylesheet' href='js-form-validation.css' type='text/css' />  
<script src="formValidation.js"></script>  
</head>  
<body onload="document.registration.userid.focus();">  
<h1>Registration Form</h1>  
<p>Use tab keys to move from one input field to the next.</p>  
<form name='registration' action="signUpMethod" method="post" onchange="return formValidation();">  
<ul>  
<li><label for="username">User id:</label><font color="red">${requestScope.error}</font> </li> 
<li><input type="text" name="username" size="12" /><font color="red"><label id="muserid"></label></font> </li>  
<li><label for="password">Password:</label></li>  
<li><input type="password" name="password" size="12" /><font color="red"><label id="mpassid"></label></font> </li>  
<li><label for="name">Name:</label></li>  
<li><input type="text" name="name" size="50" /><font color="red"><label id="musername"></label></font></li>   
<li><label for="phone">Phone:</label></li>  
<li><input type="text" name="phone" size="50" /><font color="red"><label id="mphone"></label></font></li>   
<li><label for="cuisine">Cuisine:</label></li>  
<li><input type="text" name="cuisine" size="50" /><font color="red"><label id="mcuisine"></label></font></li>   
<li><label for="country">Country:</label></li>  
<li><select name="country">  
<option selected="" value="Default">(Please select a country)<font color="red"><label id="mcountry"></label></font></option>  
<option value="AF">Australia</option>  
<option value="AL">Canada</option>  
<option value="DZ">India</option>  
<option value="AS">Russia</option>  
<option value="AD">USA</option>  
</select></li> 
<li><label for="city">City:</label></li>  
<li><input type="text" name="city" /></li>
<li><label for="state">State:</label></li>  
<li><input type="text" name="state" /></li>
<li><label for="zip">ZIP Code:</label></li>  
<li><input type="text" name="zip" /><font color="red"><label id="mzip"></label></font></li>  
<li><label for="email">Email:</label></li>  
<li><input type="text" name="email" size="50" /><font color="red"><label id="memail"></label></font></li>  
<li><label id="gender">Sex:</label></li> 
<font color="red"><label id="mgender"></label></font> 
<li><input type="radio" name="msex" value="Male" /><span>Male</span></li>  
<li><input type="radio" name="fsex" value="Female" /><span>Female</span></li>  
<li><label>Language:</label></li>  
<li><input type="checkbox" name="en" value="en" checked /><span>English</span></li>  
<li><input type="checkbox" name="nonen" value="noen" /><span>Non English</span></li>  
<li><label for="desc">About:</label></li>  
<li><textarea name="desc" id="desc"></textarea></li>  
<li><input type="submit" name="submit" value="Submit" /></li>  
</ul>  
</form>  
</body>  
</html>  