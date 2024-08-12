
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<figcaption style="max-width: 30%">
    <div class ="figcaptionForm">
        <form  action="${pageContext.request.contextPath}/order/addToCart">
            <input type="hidden" name="productId" value="1">

            <input type="text"
                   value="${form.bookingDate}"
                   name="bookingDate"
                   placeholder="Date (yyyy-MM-dd)"
            >
            <input type="text"
                   value="${form.numberOfPax}"
                   name="numberOfPax"
                   placeholder="# of people"
            >
            <input type="text"
                   value="${form.durationHours}"
                   name="durationHours"
                   placeholder="Duration (# hours)"
            >
            <input type="text"
                   value="${form.quantityOrdered}"
                   name="quantityOrdered"
                   placeholder="Quantity (type a #)"
            >
            <div>
                <button class = "makeReservationButton" type="submit">Add to cart</button>
            </div>
        </form>
        <div id="bookingError"></div>
    </div>
</figcaption>
