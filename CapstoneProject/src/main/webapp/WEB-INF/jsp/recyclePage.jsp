<!-- ----------------------------------------------- Grid cards with Services ------------------------>
<div class="cards">
    <div class="card"> <!-- ----------------------------------------------------------Havana -------->
        <img class="card_image" src="${pageContext.request.contextPath}/pub/images/places/Havana/Plaza%20Vieja.JPG" alt="Old Havana" >
        <span class="image_text">Havana</span>
        <div class="card_content">
            <p>Walking Tour<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/directions_walk_green.png" alt="walking_icon"></span></p>
            <p>Duration 3 hours<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/schedule_green.png" alt="walking_icon"></span></p>
        </div>
        <div class="price_info"> 20 usd /person /hour </div>
    </div>

    <div class="card"> <!-- ----------------------------------------------------------Viñales -------->
        <img class="card_image" src="${pageContext.request.contextPath}/pub/images/places/Vi%C3%B1ales/Vi%C3%B1ales%20Valley.JPG" alt="Viñales" >
        <span class="image_text">Viñales</span>
        <div class="card_content">
            <p>Hikking Tour (Difficulty: Easy)<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/hiking_green.png" alt="hiking_icon"></span></p>
            <p>Duration 4 hours<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/schedule_green.png" alt="walking_icon"></span></p>
        </div>
        <div class="price_info"> 25 usd / person</div>
    </div>

    <div class="card"> <!-- ----------------------------------------------------------Old American Cars -------->
        <img class="card_image" src="${pageContext.request.contextPath}/pub/images/cars/laNave.JPG" alt="Old Car" >
        <span class="image_text">Old Cars</span>
        <div class="card_content">
            <p>Old Vintage Cars Ride<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/car_green.png" alt="car_icon"></span></p>
            <p>Duration 1 hour (minimun) <span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/schedule_green.png" alt="walking_icon"></span></p>
        </div>
        <div class="price_info"> 60 usd / hour</div>
    </div>

    <div class="card"> <!-- ----------------------------------------------------------Trinidad -------->
        <img class="card_image" src="${pageContext.request.contextPath}/pub/images/places/Trinidad/Trinidad%20church%20Cuba.JPG" alt="Trinidad" >
        <span class="image_text">Trinidad</span>
        <div class="card_content">
            <p>Walking Tour<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/directions_walk_green.png" alt="walking_icon"></span></p>
            <p>Duration 2 hours<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/schedule_green.png" alt="walking_icon"></span></p>
        </div>
        <div class="price_info"> 20 usd / person</div>
    </div>
</div>



<!-- ------------------------------------------Popup Form (Hidden) for sing in -------------------------->
<div id="popupForm">
    <form id="signInForm">
        <input type="text" placeholder="Username" id="username" required>
        <input type="password" placeholder="Password" id="password" required>
        <button type="submit">Sign In</button>
    </form>
    <div id="errorMessages"></div>
</div>

<!-- ------------------------------------------------------------------------------------------------------------------------ -->

<table id="profileTable">
    <!-- ------------------Order Id -------------------->
    <tr>
        <td style="font-weight: bolder;">Order Id: </td>
        <td>${detail.orderId}</td>
    </tr>
    <!-- ------------------Create date -------------------->
    <tr>
        <td style="font-weight: bolder;">Order created on:</td>
        <td>${detail.createDate}</td>
    </tr>
    <!-- -------------Product Id -------------------->
    <tr>
        <td style="font-weight: bolder;">Product Id:</td>
        <td>${detail.productId}</td>
    </tr>
    <!-- ---------- Booking date-------------------->
    <tr>
        <td style="font-weight: bolder;">Reservation date :</td>
        <td>${detail.bookingDate}</td>
    </tr>
    <!-- ---------- Duration (hours)-------------------->
    <tr>
        <td style="font-weight: bolder;">Duration (hours):</td>
        <td>${detail.durationHours}</td>
    </tr>
    <!-- ---------- Number of people-------------------->
    <tr>
        <td style="font-weight: bolder;">Number of people:</td>
        <td>${detail.numberOfPax}</td>
    </tr>
    <!-- ---------- Quantity ordered-------------------->
    <tr>
        <td style="font-weight: bolder;">Quantity ordered:</td>
        <td>${detail.quantityOrdered}</td>
    </tr>
    <!-- ---------- Total price-------------------->
    <tr>
        <td style="font-weight: bolder;">Total Price:</td>
        <td>${detail.totalPrice}</td>
    </tr>
    <!-- ---------- Status-------------------->
    <tr>
        <td style="font-weight: bolder;">Status:</td>
        <td>${detail.status}</td>

        </c:forEach>

</table>