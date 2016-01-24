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

        <script src="${pageContext.request.contextPath}/pages/onsen/angular.min.js"></script>
        <script src="${pageContext.request.contextPath}/pages/onsen/onsenui.min.js"></script>
        <link href="${pageContext.request.contextPath}/pages/site.css" rel="stylesheet" type="text/css" />
        <script>
            ons.bootstrap();
        </script>

        <title>JavaScript Form Validation using a sample registration form</title>   
        <link href="${pageContext.request.contextPath}/pages/forms.css" rel="stylesheet" type="text/css" /> 
        <script src="${pageContext.request.contextPath}/pages/formValidation.js"></script> 

    </head>  
    <body>
    <ons-page>
        <form name='registration' action="signUpMethod" method="post" onchange="return formValidation();" >
            <ons-toolbar>
                <div class="left"><ons-back-button>Back</ons-back-button></div>
                <div class="center">Sign up</div>
            </ons-toolbar>

            <div class="formarea">
                
                <div class="form-row">
                    <font color="red">${msgUser}</font><br>
                    <input type="text" name="username" class="text-input--underbar width-full" placeholder="Username" value="">
                    <input type="password" name="password" class="text-input--underbar width-full" placeholder="Password" value="">
                </div>
                
                <div class="form-row">
                    <input type="text" name="name" class="text-input--underbar width-half" placeholder="Name" value="">

                    <input type="text" name="phone" class="text-input--underbar width-half" placeholder="Phone" value="">
                </div>
                
                <div class="form-row">
                    <input type="text" name="cuisine" class="text-input--underbar width-half" placeholder="Cuisine" value="">
                </div>
                
                <div class="form-row">
                    <input type="text" name="country" class="text-input--underbar width-half" placeholder="Country" value="">

                    <input type="text" name="city" class="text-input--underbar width-half" placeholder="City" value="">
                </div>
                
                <div class="form-row">
                    <input type="text" name="state" class="text-input--underbar width-half" placeholder="State" value="">

                    <input type="text" name="zip" class="text-input--underbar width-half" placeholder="Zip Code" value="">
                </div>
                

                <div class="form-row">
                    <input type="text" name="email" class="text-input--underbar width-full" placeholder="Email" value="">
                </div>

                

                <div class="lucent">
                    <p class="note">Password - 7 characters or more</p>
                </div>

                <div class="vspc form-row">
                    <ons-button style="background:none;" modifier="large--cta"><input type="submit" name="submit" value="Sign up" style="width: 100%; height: 100%" /></ons-button>
                </div>
            </div>
        </form>
    </ons-page>

</body>
<!--body>  
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
</body-->  
</html>  