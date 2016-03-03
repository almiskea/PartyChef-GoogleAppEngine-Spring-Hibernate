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
        <title>Party Chef</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

        <style>
            #topContainer{
                background-image:url("${pageContext.request.contextPath}/images/IMG_2024.jpg");
                width:100%;
                height:100%;
                background-size:cover;
            }
            .contentContainer{
                width:100%;
                height:100%;
            }
            .title{
                margin-top:100px;
                font-size:2em;
            }
            #webName{
                margin-top:200px;
                text-align:center;
                color: white;
            }
            #webName h1{
                font-size: 5em;
                font-weight: bold;
            }
            .center{
                text-align:center;
            }
            #submit{
                margin-top:0px;
            }
            #lastContainer{
                background-color: grey;
            }
            #lastContainer2{
                background-image:url("images/appstore.png");
                background-size: 100%;
                background-repeat: no-repeat;
            }
            .margin-bottom{
                margin-bottom:30px;
            }
        </style>
    </head>
    <body>

        <div class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" >Party Chef</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="#about">Sign UP</a></li>
                        <li><a href="#contact">Contact</a></li>

                    </ul>
                    <font color="red">${msg}</font>
                    <form action="loginMethod" method="POST" class="navbar-form navbar-right">
                        <div class="form-group ">

                            <input type="text" name="username" placeholder="username" class="form-control"/>

                        </div>
                        <div class="form-group ">

                            <input type="password" name="password" placeholder="password" class="form-control"/>
                        </div>
                        <input type="submit" class="btn btn-success" id="submit" value="Log In">
                        <input type="submit" class="btn btn-success" id="submit" value="forgot-password">
                    </form>
                </div><!-- /.nav-collapse -->
            </div><!-- /.container -->

        </div>
        <div class="container contentContainer" id="topContainer">

            <div class="row">

                <div class="col-md-6 col-md-offset-3" id="webName">

                    <h1>Party Chef</h1>
                    <p class="lead">This app helps you make dinner parties cheaper, 
                        or make money by cooking for local parties!</p>
                    <p>more details</p>
                    <p class="bold">Interested? Join our Mailing list!</p>

                    <form>

                        <div class="input-group">
                            <span class="input-group-addon">@</span>
                            <input type="email" class="form-control" placeholder="your email">

                        </div>

                        <button type="submit" class="btn btn-success">Submit</button>
                    </form>
                </div>

            </div>



        </div>
        <div class="container  margin-bottom">
            <div class="row center">
                <h1 class="title">Why Party Chef is awesome</h1>

                <p class="lead center">With Party Chef you can both make and save money with having a unique experience.</p>

            </div>
            <div class="row center">
                <div class="col-md-4">
                    <h2><span class="glyphicon glyphicon-music">Find Party Chefs in your town</h2>
                    <p>You might use the experience of your neighbor to have them cook to you for less, which is both exciting and economic.</p>
                    <button class="btn btn-success marginTop">Sign Up!</button>


                </div>
                <div class="col-md-4">
                    <h2><span class="glyphicon glyphicon-music">Sharpen your cooking skills</h2>
                    <p>This is a wild experience that could make earn money and you could discover yourself by others opinions.</p>
                    <button class="btn btn-success marginTop">Sign Up!</button>


                </div>
                <div class="col-md-4">
                    <h2><span class="glyphicon glyphicon-music">Enjoy various real cuisine in your town</h2>
                    <p>With Party Chef, you are exposed to all the cuisine in your area with having the people cook for you, which is as you all know
                        way more realistic than the restaurant.</p>
                    <button class="btn btn-success marginTop">Sign Up!</button>


                </div>

            </div>
        </div> 

    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script>



        $(".contentContainer").css("min-height", $(window).height());



    </script>


</html>
