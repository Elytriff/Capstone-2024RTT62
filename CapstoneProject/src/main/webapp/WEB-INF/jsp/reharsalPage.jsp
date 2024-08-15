<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="include/header.jsp"/>

<%-- ----------------------------------------------- Grid cards with Services --------------------- --%>
<c:choose>
    <%-- -----------------------------------------------------------If products in search bar------------------------------- --%>
    <c:when test="${not empty productsListToken}">
        <c:forEach items="${productsListToken}" var="productsList">
            <div class="cards">
                <div class="card">
                        <%-- Link images to their respective product pages based on product name --%>
                    <c:choose>
                        <c:when test="${productsList.productName == 'Havana Walking Tour'}">
                            <a href="${pageContext.request.contextPath}/havanaTour">
                                <img class="card_image" src="${productsList.imageUrl}" alt="Havana Walking Tour">
                            </a>
                        </c:when>
                        <c:when test="${productsList.productName == 'Viñales Valley Tour'}">
                            <a href="${pageContext.request.contextPath}/vinalesTour">
                                <img class="card_image" src="${productsList.imageUrl}" alt="Viñales Valley Tour">
                            </a>
                        </c:when>
                        <c:when test="${productsList.productName == 'Trinidad Walking Tour'}">
                            <a href="${pageContext.request.contextPath}/trinidadTour">
                                <img class="card_image" src="${productsList.imageUrl}" alt="Trinidad Walking Tour">
                            </a>
                        </c:when>
                        <c:when test="${productsList.productName == 'Chevrolet55' || productsList.productName == 'Ford56' || productsList.productName == 'Ford52' || productsList.productName == 'Buick'}">
                            <a href="${pageContext.request.contextPath}/oldVintageCars">
                                <img class="card_image" src="${productsList.imageUrl}" alt="${productsList.productName}">
                            </a>
                        </c:when>
                        <c:otherwise>
                            <img class="card_image" src="${productsList.imageUrl}" alt="${productsList.productName}">
                        </c:otherwise>
                    </c:choose>
                    <span class="image_text">${productsList.productName}</span>
                    <div class="card_content">
                        <p>${productsList.description} (Difficulty: ${productsList.difficulty})
                            <span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/directions_walk_green.png" alt="walking_icon"></span>
                        </p>
                        <p>Duration ${productsList.durationInHours} hours
                            <span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/schedule_green.png" alt="walking_icon"></span>
                        </p>
                    </div>
                    <div class="price_info">${productsList.pricePerPaxPerHour} USD /person /hour</div>
                </div>
            </div>
        </c:forEach>
    </c:when>

    <%-- -----------------------------------------------------------If no products in search bar------------------------------- --%>
    <c:otherwise>
        <%-- ----------------------------------------------- Grid cards with Services ---------------------- --%>
        <div class="cards">
            <div class="card"> <%-- ----------------------------------------------------------Havana ------ --%>
                <a href="${pageContext.request.contextPath}/havanaTour">
                    <img class="card_image" src="${pageContext.request.contextPath}/pub/images/places/Havana/Plaza%20Vieja.JPG" alt="Old Havana">
                </a>
                <span class="image_text">Havana Walking Tour</span>
                <div class="card_content">
                    <p>Walking Tour<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/directions_walk_green.png" alt="walking_icon"></span></p>
                    <p>Duration 3 hours<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/schedule_green.png" alt="walking_icon"></span></p>
                </div>
                <div class="price_info">20 USD /person /hour</div>
            </div>

            <div class="card"> <%-- ----------------------------------------------------------Viñales ------ --%>
                <a href="${pageContext.request.contextPath}/vinalesTour">
                    <img class="card_image" src="${pageContext.request.contextPath}/pub/images/places/Vi%C3%B1ales/Vi%C3%B1ales%20Valley.JPG" alt="Viñales">
                </a>
                <span class="image_text">Viñales Valley Tour</span>
                <div class="card_content">
                    <p>Hikking Tour (Difficulty: Easy)<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/hiking_green.png" alt="hiking_icon"></span></p>
                    <p>Duration 4 hours<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/schedule_green.png" alt="walking_icon"></span></p>
                </div>
                <div class="price_info">25 USD /person</div>
            </div>

            <div class="card"> <%-- ----------------------------------------------------------Old Vintage Cars --------%>
                <a href="${pageContext.request.contextPath}/oldVintageCars">
                    <img class="card_image" src="${pageContext.request.contextPath}/pub/images/cars/laNave.JPG" alt="Old Car">
                </a>
                <span class="image_text">Old Vintage Cars Ride</span>
                <div class="card_content">
                    <p>Old Vintage Cars Ride<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/car_green.png" alt="car_icon"></span></p>
                    <p>Duration 1 hour (minimum)<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/schedule_green.png" alt="walking_icon"></span></p>
                </div>
                <div class="price_info">60 USD /hour</div>
            </div>

            <div class="card"> <%-- ----------------------------------------------------------Trinidad --------%>
                <a href="${pageContext.request.contextPath}/trinidadTour">
                    <img class="card_image" src="${pageContext.request.contextPath}/pub/images/places/Trinidad/Trinidad%20church%20Cuba.JPG" alt="Trinidad">
                </a>
                <span class="image_text">Trinidad Walking Tour</span>
                <div class="card_content">
                    <p>Walking Tour<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/directions_walk_green.png" alt="walking_icon"></span></p>
                    <p>Duration 2 hours<span><img class="icons" src="${pageContext.request.contextPath}/pub/images/icons/schedule_green.png" alt="walking_icon"></span></p>
                </div>
                <div class="price_info">20 USD /person</div>
            </div>
        </div>
    </c:otherwise>
</c:choose>

<jsp:include page="include/footer.jsp"/>

<div class="form-group">
    <label for="title">Title</label>
    <input type="text" id="title" name="title" value="${form.title}"
           placeholder="Event Title" class="form-control"
           <c:if test="${bindingResult.hasFieldErrors('title')}">is-invalid</c:if>>
    <c:if test="${bindingResult.hasFieldErrors('title')}">
        <c:forEach items="${bindingResult.getFieldErrors('title')}" var="error">
            <small id="emailHelp" class="form-text text-danger">${error.defaultMessage}</small>
        </c:forEach>
    </c:if>
</div>
