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
        <section>
            <nav id="nav01"></nav>

            <div id="main">



                <div style="padding: 10px 9px">
                    <ons-toolbar>
                        <div class="center"> Welcome ${sessionScope.user.username}</div>
                    </ons-toolbar>
                    <ons-button  modifier="large" style="margin: 0 auto;" href="logoutMethod">
                         <a href='logoutMethod'>Logout</a>
                    </ons-button>
                </div>
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
        </section>
         <ons-bottom-toolbar>
                <div style='text-align: center;'>
                    <ons-toolbar-button onclick="goTo('Home');">Home</ons-toolbar-button>
                    <ons-toolbar-button ng-click="app.navi.pushPage('profile');">Profile</ons-toolbar-button>
                    <ons-toolbar-button ng-click="app.navi.pushPage('about');">About</ons-toolbar-button>
                </div>
            </ons-bottom-toolbar>
    </body>
</html>