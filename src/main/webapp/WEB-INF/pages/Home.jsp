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
    <script>
        function goTo(page) {
            document.location.href = page;
        }
    </script>
    <style>
        .tab {
            line-height: 1;
        }

        .tab-icon {
            font-size: 22px;
            padding: 0;
            margin: 0;
        }

        .tab-label {
            margin: 0;
            padding: 0;
            font-size: 12px;
        }

        .person-list {
            border-top: none;
        }

        .person {
            line-height: 1;
        }

        .person-list-header {
            opacity: 0.6;
        }

        .person-name {
            line-height: 44px;
        }

        .person-image {
            width: 30px;
            height: 30px;
            margin-top: 8px;
            border-radius: 2px;
        }
    </style>
    <body>

    <ons-navigator animation="slide" var="app.navi">
        <ons-page>
            <ons-toolbar>
                <div class="center">
                    Chefs
                </div>
                <div class="right">
                    <ons-toolbar-button>
                        <ons-icon icon="ion-plus" fixed-width="false" style="vertical-align: -4px;"></ons-icon>
                    </ons-toolbar-button>
                </div>
            </ons-toolbar>
            <ons-list-item class="person" modifier="tappable">
                <ons-row>
                    <div class="navigation-bar__center">
                        <input type="search" class="search-input" style="width: 96%; margin: 6px auto 6px auto;" placeholder="Search">
                    </div>
                </ons-row>
            </ons-list-item>
            <c:forEach items="${sessionScope.UList}" var="element">
                <ons-list-item class="person" modifier="tappable" ng-click="console.log('Here');
                    app.navi.pushPage('user${element.username}.html');">
                    <ons-row>
                        <ons-col width="40px">
                            <img src="serve/${element.username}" class="person-image" />

                        </ons-col>
                        <ons-col class="person-name">
                            ${element.name}
                        </ons-col>


                    </ons-row>
                </ons-list-item>
            </c:forEach>

            <ons-bottom-toolbar>
                <div style='text-align: center;'>
                    <ons-toolbar-button onclick="goTo('Home');">Home</ons-toolbar-button>
                    <ons-toolbar-button ng-click="app.navi.pushPage('profile');">Profile</ons-toolbar-button>
                    <ons-toolbar-button ng-click="app.navi.pushPage('about');">About</ons-toolbar-button>
                </div>
            </ons-bottom-toolbar>

        </ons-page>
    </ons-navigator>

    <c:forEach items="${sessionScope.UList}" var="person">
        <ons-template id="user${person.username}.html">
            <ons-page>
                <ons-toolbar>
                    <div class="left">
                        <ons-back-button>Back</ons-back-button>
                    </div>
                    <div class="center">
                        Chef ${person.name}
                    </div>
                </ons-toolbar>

                <table class = "table">

                    <tbody>


                        <tr>
                            <th>Username</th>
                            <td>${person.username}</td>
                        </tr>
                        <tr>
                            <th>Name</th>
                            <td>${person.name}</td>
                        </tr>
                        <tr>
                            <th>Country</th>
                            <td>${person.country}</td>
                        </tr>
                        <tr>
                            <th>City</th>
                            <td>${person.city}</td>
                        </tr>
                        <tr>
                            <th>State</th>
                            <td>${person.state}</td>
                        </tr>
                        <tr>
                            <th>Zip</th>
                            <td>${person.zip}</td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td>${person.email}</td>
                        </tr>
                        <tr>
                            <th>Phone</th>
                            <td>${person.phone}</td>
                        </tr>
                        <tr>
                            <th>Cuisine</th>
                            <td>${person.cuisine}</td>
                        </tr>
                    </tbody>
                </table>
            </ons-page>
        </ons-template>
    </c:forEach>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

</html>
