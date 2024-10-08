<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="include/header.jsp"/>

<Style>
    .checkoutButton {
        background-color: rgb(145, 152, 14);
        color: white;
        border: none;
        cursor: pointer;
    }
    .checkoutButton:hover {
        background-color: rgb(198, 206, 22);
    }
</Style>

<c:if test="${not empty message}">
    <div style="text-align: center; color: red; margin-top: 20px;">
        <p>${message}</p>
    </div>
    <br>
    <div style="text-align: center">
        <a href="https://www.flaticon.es/iconos-gratis/carro-vacio" title="carro vacio iconos"></a>
        <img src="${pageContext.request.contextPath}/pub/images/icons/carro-vacio.png" alt="empty shooping cart">
    </div>
</c:if>

<div class="cards">
    <c:forEach items="${cartDetail}" var="cart">
        <div class="card"> <!-- --------------------------------------------In the image -------->
            <img class="card_image" src="${cart.imageUrl}"
                 alt="">
            <span class="image_text">${cart.productName}</span>
            <!-- --------------------------------------------------------down the image  -------->
            <div class="card_content">
                <p> ${cart.name} ${cart.lastName} / ${cart.numberOfPax} pax
                    <span><img
                            class="icons"
                            src="${pageContext.request.contextPath}/pub/images/icons/directions_walk_green.png"
                            alt="walking icon">
                    </span></p>
                <p> Order Id: ${cart.orderId}</p>
                <p> Location: ${cart.location} ${cart.durationHours} Hours
                    <span><img
                            class="icons"
                            src="${pageContext.request.contextPath}/pub/images/icons/schedule_green.png"
                            alt="clock icon">
                    </span>
                </p>
                <p>Booking date: ${cart.bookingDate}</p>
                <p>Quantity ordered: ${cart.quantityOrdered}</p>
            </div>
        </div>
        <div class="card"> <!-- --------------------------------------------Price  -------->

            <div class="price_info"> Total price: ${cart.totalPrice} usd</div>
            <div class="price_info"> Status: ${cart.status}</div>

            <div style="text-align: center; font-size:150%">
                <a class="aEdit" href="${pageContext.request.contextPath}/order/editOrderDetail/${cart.orderDetailId}">Edit</a>
            </div>
        </div>
    </c:forEach>
</div>
<!-- --------------------------------------------Check out  -------->
<c:if test="${not empty cartDetail}">
    <div style="text-align: center; margin-top: 20px;">
        <form action="${pageContext.request.contextPath}/order/checkout">
            <button class="checkoutButton" type="submit">Check out</button>
        </form>
    </div>
</c:if>

<jsp:include page="include/footer.jsp"/>