<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<jsp:include page="include/header.jsp"/>

<!-- ----------------------------------------------- Grid cards with Services ------------------------>
<div class="cards">
    <c:forEach items="${productsListToken}" var="productsList">
        <div class="card"> <!-- ----------------------------------------------------------Havana -------->
            <img class="card_image" src="${productsList.imageUrl}"
                 alt="">
            <span class="image_text">${productsList.productName}</span>
            <div class="card_content">
                <p>${productsList.description} (Difficulty: ${productsList.difficulty})
                    <span><img
                        class="icons"
                        src="${pageContext.request.contextPath}/pub/images/icons/directions_walk_green.png"
                        alt="walking_icon">
                    </span>
                </p>
                <p>Duration ${productsList.durationInHours} hours
                    <span><img
                            class="icons"
                            src="${pageContext.request.contextPath}/pub/images/icons/schedule_green.png"
                            alt="walking_icon">
                    </span>
                </p>
            </div>
            <div class="price_info"> ${productsList.pricePerPaxPerHour} usd /person /hour</div>
        </div>
    </c:forEach>
</div>


<jsp:include page="include/footer.jsp"/>