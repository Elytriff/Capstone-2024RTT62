<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="include/header.jsp" />

<!-- ----------------------------------------------- Grid cards with Services ------------------------>
<div class="cards">
    <div class="card"> <!-- ----------------------------------------------------------Havana -------->
        <img class="card_image" src="${pageContext.request.contextPath}/pub/images/places/Havana/Plaza%20Vieja.JPG" alt="Old Havana" >
        <span class="image_text">Havana</span>
        <div class="card_content">
            <p>Walking Tour<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/directions_walk_green.png" alt="walking_icon"></span></p>
            <p>Duration 1-3 hour<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/schedule_green.png" alt="walking_icon"></span></p>
        </div>
        <div class="price_info"> Starting at 20 usd / person</div>
    </div>

    <div class="card"> <!-- ----------------------------------------------------------Viñales -------->
        <img class="card_image" src="${pageContext.request.contextPath}/pub/images/places/Vi%C3%B1ales/Vi%C3%B1ales%20Valley.JPG" alt="Viñales" >
        <span class="image_text">Viñales</span>
        <div class="card_content">
            <p>Hikking Tour (Difficulty: Easy)<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/hiking_green.png" alt="hiking_icon"></span></p>
            <p>Duration 3-4 hour<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/schedule_green.png" alt="walking_icon"></span></p>
        </div>
        <div class="price_info"> Starting at 25 usd / person</div>
    </div>

    <div class="card"> <!-- ----------------------------------------------------------Old American Cars -------->
        <img class="card_image" src="${pageContext.request.contextPath}/pub/images/cars/laNave.JPG" alt="Old Car" >
        <span class="image_text">Old Cars</span>
        <div class="card_content">
            <p>Old Vintage Cars Ride<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/car_green.png" alt="car_icon"></span></p>
            <p>Duration 1 hour (minimun) <span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/schedule_green.png" alt="walking_icon"></span></p>
        </div>
        <div class="price_info"> Starting at 60 usd / hour</div>
    </div>

    <div class="card"> <!-- ----------------------------------------------------------Trinidad -------->
        <img class="card_image" src="${pageContext.request.contextPath}/pub/images/places/Trinidad/Trinidad%20church%20Cuba.JPG" alt="Trinidad" >
        <span class="image_text">Trinidad</span>
        <div class="card_content">
            <p>Walking Tour<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/directions_walk_green.png" alt="walking_icon"></span></p>
            <p>Duration 1-3 hour<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/schedule_green.png" alt="walking_icon"></span></p>
        </div>
        <div class="price_info">  Starting at 20 usd / person</div>
    </div>
</div>



<jsp:include page="include/footer.jsp" />