<%-- 
    Document   : Home
    Created on : Oct 18, 2015, 3:50:16 PM
    Author     : Ali
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="js/script.js"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/onsen/onsenui.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/pages/onsen/onsentheme.css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/pages/onsen/angular.js"></script>
        <script src="${pageContext.request.contextPath}/pages/onsen/onsenui.js"></script>

        <title>Profile</title>



    </head>
    <body>


        <div class="container">
            <h1>Edit Profile</h1>
            <hr>
            <div class="row">
                <!-- left column -->
                <div class="col-md-3 center">
                    

                        <c:if test="${sessionScope.image == null}">
                            <img src="serve/almiskea" class="avatar img-circle" height="120" width="120" alt="avatar"/>
                            <!--img src="imageController/almiskea" class="avatar img-circle" height="120" width="120" alt="avatar"/-->
                        </c:if>
                        <h6>Upload a different photo...</h6>
                        <form method="post" action="upload" enctype="multipart/form-data">
                            <input type="file" name="file1" size="50" />
                            <input type="submit" value="Upload" />
                        </form>
                        
                   
                </div>

                <!-- edit form column -->
                <br>
                <div class="col-md-9 personal-info">
                    <div class="alert alert-info alert-dismissable">
                        <a class="panel-close close" data-dismiss="alert">×</a> 
                        <i class="fa fa-coffee"></i>
                        This is an <strong>.alert</strong>. Use this to show important messages to the user.
                    </div>
                    <h3>Personal info</h3>

                    <form name='profile' action="profileUpdate" method="post" class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Name:</label>
                            <div class="col-lg-8">
                                <input class="form-control" name="name" type="text" value="${sessionScope.user.name}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Country</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" name="country" value="${sessionScope.user.country}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">City</label>
                            <div class="col-lg-8">
                                <input class="form-control" name="city" type="text" value="${sessionScope.user.city}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">State:</label>
                            <div class="col-md-8">
                                <input class="form-control" name="state" type="text" value="${sessionScope.user.state}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Zip:</label>
                            <div class="col-md-8">
                                <input class="form-control" name="zip" type="text" value="${sessionScope.user.zip}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Email:</label>
                            <div class="col-md-8">
                                <input class="form-control" name="email" type="text" value="${sessionScope.user.email}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Phone:</label>
                            <div class="col-md-8">
                                <input class="form-control" name="phone" type="text" value="${sessionScope.user.phone}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">Cuisine</label>
                            <div class="col-md-8">
                                <input class="form-control" name="cuisine" type="text" value="${sessionScope.user.cuisine}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label"></label>
                            <div class="col-md-8">
                                <input type="submit" class="btn btn-primary" value="Save Changes">
                                <span></span>
                                <input type="reset" class="btn btn-default" value="Cancel">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <hr>
         <ons-bottom-toolbar>
                <div style='text-align: center;'>
                    <ons-toolbar-button onclick="goTo('Home');">Home</ons-toolbar-button>
                    <ons-toolbar-button ng-click="app.navi.pushPage('profile');">Profile</ons-toolbar-button>
                    <ons-toolbar-button ng-click="app.navi.pushPage('about');">About</ons-toolbar-button>
                </div>
            </ons-bottom-toolbar>
        <!--section>
            <style>
                img {
                    float: right;
                    margin: 0 25px 10px 10px;
                }
            </style>
            <nav id="nav01"></nav>
            <div id="main">
                <div style="padding: 10px 9px">
                    <ons-toolbar>
                        <div class="center"> Welcome ${sessionScope.user.username}</div>
                    </ons-toolbar>
                    <ons-button  modifier="large" style="margin: 0 auto;" >
                        <a href='logoutMethod'>Logout</a>
                    </ons-button>
                </div>
                <br>
                <br>
                <form name='profile' action="profileUpdate" method="post" >  

        <c:if test="${sessionScope.image == null}">
            <img src="serve" height="120" width="120"/>
        </c:if>

        <table border="1">
            <tr>
                <td><label for="username">User id:</label></td>
                <td> ${sessionScope.user.username}</td>
            </tr><tr>
                <td><label for="name">Name:</label></td>
                <td> <input type="text" name="name" placeholder="${sessionScope.user.name}"/></td>
            </tr><tr>
                <td><label for="country">Country:</label></td>
                <td> <input type="text" name="country" placeholder="${sessionScope.user.country}"/></td>
            </tr><tr>
                <td><label for="city">City:</label>
                <td> <input type="text" name="city" placeholder="${sessionScope.user.city}"/></td>
            </tr><tr>
                <td><label for="state">State:</label></td>
                <td>  <input type="text" name="state" placeholder="${sessionScope.user.state}"/></td>
            </tr><tr>
                <td><label for="zip">Zip:</label></td>
                <td>  <input type="text" name="zip" placeholder="${sessionScope.user.zip}"/></td>
            </tr><tr>
                <td><label for="email">Email:</label></td>
                <td> <input type="text" name="email" placeholder="${sessionScope.user.email}"/></td>
            </tr><tr>
                <td><label for="phone">Phone:</label></td>
                <td> <input type="text" name="phone" placeholder="${sessionScope.user.phone}"/></td>
            </tr><tr>
                <td><label for="cuisine">Cuisine:</label></td>
                <td><input type="text" name="cuisine" placeholder="${sessionScope.user.cuisine}"/></td>
            </tr>


        </table>
        <input type="submit" value="update">
    </form>
            
   


    <form method="post" action="uploadRecipeImage" enctype="multipart/form-data">
        <table border="0">

            <tr>
                <td><input type="file" name="file1" size="50" /></td>
                <td><input type="submit" value="Upload recepie" /></td>
            </tr>
        </table>
    </form>

    <img src="serveRecipeImage" height="120" width="120"/>  
    <footer id="foot01"></footer>

</div>
<script src="${pageContext.request.contextPath}/pages/script.js"></script>

</section>
</body-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

</html>

