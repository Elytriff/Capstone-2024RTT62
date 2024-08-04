<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="https://fonts.googleapis.com/css2?family=Kalnia+Glaze:wght@100..700&family=Lobster&display=swap" rel="stylesheet">

     <!-- internal CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pub/css/homepage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pub/css/carrusel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pub/css/registrationPage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/pub/css/customerProfile.css">

    <script src="${pageContext.request.contextPath}/pub/js/popupSingIn.js"></script>
</head>

<body>
<section>
    <header>
        <div class="container">
            <div class="row">
                <div class="col">
                </div>
                <div class="col-md-auto">
                    <img src="${pageContext.request.contextPath}/pub/images/icons/logo.png" alt="Qvainside Logo">
                </div>
                <!-- --------------------------Log In and Register---------------------------------- -->

                <div class="col" style="justify-content: center; display: flex; flex-direction: column; align-items:center;">
                    <a  id="signInTrigger" class="aHome">Log in</a>
                    <a href="${pageContext.request.contextPath}/registrationPage" class="aHome" onclick="goToRegistration()">Register</a>
                </div>
                <!-- Popup Form -->
                <div id="popupForm">
                    <form id="signInForm">
                        <input type="text" placeholder="Username" id="username" required>
                        <input type="password" placeholder="Password" id="password" required>
                        <button type="submit">Sign In</button>
                    </form>
                    <div id="errorMessages"></div>
                </div>
            </div>
        </div>

        <!---------------------------------------------Navigation Bar -------------------->
        <div class="navbar">
            <div class="nav-item">
            <a href="${pageContext.request.contextPath}/homePage">HOME</a>
            </div>

            <div class="nav-item dropdown">
                <a href="${pageContext.request.contextPath}/homePage">TOURS</a>
                    <i class="fa fa-caret-down"></i>
                <div class="dropdown-content">
                    <a href="${pageContext.request.contextPath}/havanaTour">HAVANA</a>
                    <a href="${pageContext.request.contextPath}/trinidadTour">TRINIDAD</a>
                    <a href="${pageContext.request.contextPath}/viñalesTour">VIÑALES</a>
                    <a href="${pageContext.request.contextPath}/oldVintageCars">OLD VINTAGE CARS TOUR</a>
                </div>
            </div>
        </div>
    </header>
</section>

