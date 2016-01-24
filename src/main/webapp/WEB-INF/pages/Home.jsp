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
        <link href="${pageContext.request.contextPath}/pages/site.css" rel="stylesheet" type="text/css" />
        <script>
            ons.bootstrap();
        </script>
    </head>
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
          <ons-list-item class="person" modifier="tappable" ng-click="console.log('Here');app.navi.pushPage('user${element.username}.html');">
            <ons-row>
              <ons-col width="40px">
              <img src="images/profile-image-0.png" class="person-image">
              </ons-col>
              <ons-col class="person-name">
                  ${element.name}
              </ons-col>
                
            </ons-row>
          </ons-list-item>
          </c:forEach>
    
    <ons-bottom-toolbar>
          <div style='text-align: center;'>
              <ons-toolbar-button ng-click="app.navi.pushPage('home.html');">Home</ons-toolbar-button>
              <ons-toolbar-button ng-click="app.navi.pushPage('home.html');">Profile</ons-toolbar-button>
              <ons-toolbar-button ng-click="app.navi.pushPage('home.html');">About</ons-toolbar-button>
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
          
<table border="1">
                        <tr>
                            <td><label for="username">User id:</label></td>
                            <td> ${person.username}</td>
                        </tr><tr>
                            <td><label for="name">Name:</label></td>
                            <td> <input type="text" name="name" placeholder="${person.name}"/></td>
                        </tr><tr>
                            <td><label for="country">Country:</label></td>
                            <td> <input type="text" name="country" placeholder="${person.country}"/></td>
                        </tr><tr>
                            <td><label for="city">City:</label>
                            <td> <input type="text" name="city" placeholder="${person.city}"/></td>
                        </tr><tr>
                            <td><label for="state">State:</label></td>
                            <td>  <input type="text" name="state" placeholder="${person.state}"/></td>
                        </tr><tr>
                            <td><label for="zip">Zip:</label></td>
                            <td>  <input type="text" name="zip" placeholder="${person.zip}"/></td>
                        </tr><tr>
                            <td><label for="email">Email:</label></td>
                            <td> <input type="text" name="email" placeholder="${person.email}"/></td>
                        </tr><tr>
                            <td><label for="phone">Phone:</label></td>
                            <td> <input type="text" name="phone" placeholder="${person.phone}"/></td>
                        </tr><tr>
                            <td><label for="cuisine">Cuisine:</label></td>
                            <td><input type="text" name="cuisine" placeholder="${person.cuisine}"/></td>
                        </tr>
              </table>
  </ons-page>
</ons-template>
  </c:forEach>

  </body>
</html>
