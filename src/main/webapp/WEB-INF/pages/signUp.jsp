<%-- 
    Document   : signUp
    Created on : Oct 18, 2015, 3:46:24 PM
    Author     : Ali
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>  
<title>JavaScript Form Validation using a sample registration form</title>   
<link href="${pageContext.request.contextPath}/pages/forms.css" rel="stylesheet" type="text/css" /> 
<script src="${pageContext.request.contextPath}/pages/formValidation.js"></script> 

</head>  
<body>  
    <h1>Registration Form</h1>  
    <p>Use tab keys to move from one input field to the next.</p>  
    <form name='registration' action="signUpMethod" method="post" onchange="return formValidation();" >  
        <table> 
            <tr>
                <td><label for="username">User id:</label><font color="red">${msgUser}</font></td>
                <td><input type="text" name="username" size="12" /><font color="red"><label id="muserid"></label></font></td>
            </tr><tr>
                <td><label for="password">Password:</label></td>
                <td><input type="password" name="password" size="12" /><font color="red"><label id="mpassid"></label></font></td>
            </tr><tr>
                <td><label for="name">Name:</label></li>  </td>
                <td><input type="text" name="name" size="50" /><font color="red"><label id="musername"></label></font> </td>
            </tr><tr>
                <td><label for="phone">Phone:</label></li>  </td>
                <td><input type="text" name="phone" size="50" /><font color="red"><label id="mphone"></label></font> </td>
            </tr><tr>
                <td><label for="cuisine">Cuisine:</label></td>
                <td><input type="text" name="cuisine" size="50" /><font color="red"><label id="mcuisine"></label></font>  </td>
            </tr><tr>
                <td><label for="country">Country:</label></td>
                <td>
                    <select name="country">  
                        <option selected="" value="Default">(Please select a country)<font color="red"><label id="mcountry"></label></font></option>  
                        <option value="AF">Australia</option>  
                        <option value="AL">Canada</option>  
                        <option value="DZ">India</option>  
                        <option value="AS">Russia</option>  
                        <option value="AD">USA</option>  
                    </select></td>
            </tr><tr>
                <td><label for="city">City:</label>  </td>
                <td><input type="text" name="city" /></td>
            </tr><tr>
                <td><label for="state">State:</label></td>
                <td><input type="text" name="state" /></td>
            </tr><tr>
                <td><label for="zip">ZIP Code:</label> </td>
                <td><input type="text" name="zip" /><font color="red"><label id="mzip"></label></font></td>
            </tr><tr>
                <td><label for="email">Email:</label><font color="red">${msgEmail}</font> </td>
                <td><input type="text" name="email" size="50" /><font color="red"><label id="memail"></label></font></td>
            </tr><tr>
                <td><label id="gender">Sex:</label></td>
            <font color="red"><label id="mgender"></label></font>
            <td><input type="radio" name="msex" value="Male" /><span>Male</span> 
                <input type="radio" name="fsex" value="Female" /><span>Female</span></td>
        </tr><tr>
        <td><label>Language:</label> </td>
        <td><input type="checkbox" name="en" value="en" checked /><span>English</span>
            <input type="checkbox" name="nonen" value="noen" /><span>Non English</span> </td>
    </tr><tr>
        <td><label for="desc">About:</label> </td>
        <td><textarea name="desc" id="desc"></textarea></td>
    </tr>
</table>
<input type="submit" name="submit" value="Submit" />


</form>  
</body>  
</html>  