<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%--
  Created by IntelliJ IDEA.
  User: oscar
  Date: 7/31/2024
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Qvainside</title>
    <!-- Bootstrap CDN-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <!-- Font Awesome CDN-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <!-- Google Fonts CDN-->
    <link href="https://fonts.googleapis.com/css2?family=Kalnia+Glaze:wght@100..700&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kalnia+Glaze:wght@100..700&family=Lobster&display=swap"
          rel="stylesheet">

    <!-- internal CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pub/css/homepage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pub/css/carrusel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pub/css/registrationPage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pub/css/customerProfile.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pub/css/orderDetail.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pub/css/editOrderDetail.css">

    <script src="${pageContext.request.contextPath}/pub/js/qvainsideFunctions.js"></script>
</head>

<body>
<section>
    <header>
        <!-- --------------------------Search bar---------------------------------- -->
        <div id="popupForm">
            <form id="signInForm" action="/product">
                <input type="text" placeholder="Type a destination or service" id="productSearch"
                       value="${productInput}" name="product">
                <button type="submit">Search</button>
            </form>
            <div id="errorMessages"></div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col">
                </div>
                <div class="col-md-auto">
                    <img src="${pageContext.request.contextPath}/pub/images/icons/logo.png" alt="Qvainside Logo">
                </div>
                <!-- --------------------------Log In and Register---------------------------------- -->

                <div class="col"
                     style="justify-content: center; display: flex; flex-direction: column; align-items:center;">

                    <sec:authorize access="!isAuthenticated()">
                        <a href="${pageContext.request.contextPath}/account/loginPage" class="aHome">Log in</a>
                        <a href="${pageContext.request.contextPath}/registrationPage" class="aHome"
                           onclick="goToRegistration()">Register</a>
                    </sec:authorize>

                    <sec:authorize access="isAuthenticated()">
                        <a href="${pageContext.request.contextPath}/account/logoutPage" class="aHome">Log out</a>
                        <span class="nav-link"><sec:authentication property="name"/></span>
                    </sec:authorize>

                </div>
            </div>
        </div>

        <!---------------------------------------------Navigation Bar -------------------->
        <div class="navbar">
            <div class="nav-item">
                <a href="${pageContext.request.contextPath}/">HOME</a>
            </div>

            <div class="nav-item dropdown">
                <a href="${pageContext.request.contextPath}/">TOURS</a>
                <i class="fa fa-caret-down"></i>
                <div class="dropdown-content">
                    <a href="${pageContext.request.contextPath}/havanaTour">HAVANA</a>
                    <a href="${pageContext.request.contextPath}/trinidadTour">TRINIDAD</a>
                    <a href="${pageContext.request.contextPath}/vinalesTour">VIÑALES</a>
                    <a href="${pageContext.request.contextPath}/oldVintageCars">OLD VINTAGE CARS TOUR</a>
                </div>
            </div>
            <div class="nav-item">
                <sec:authorize access="isAuthenticated()">
                <a href="${pageContext.request.contextPath}/order/orderDetail">YOUR ORDERS</a>
                    <a href="${pageContext.request.contextPath}/cart">CART</a>
                    <a href="${pageContext.request.contextPath}/customer/customerProfile">YOUR PROFILE</a>
                </sec:authorize>
            </div>
            <sec:authorize access="isAuthenticated()">
                <sec:authorize access="hasAnyAuthority('ADMIN')">
                    <div class="nav-item">
                        <a href="${pageContext.request.contextPath}/createProduct">CREATE</a><span> / </span>
                    </div>
                    <div class="nav-item">
                        <a href="${pageContext.request.contextPath}/productProfile"> EDIT PRODUCT</a>
                    </div>
                </sec:authorize>
            </sec:authorize>
        </div>
    </header>
</section>

