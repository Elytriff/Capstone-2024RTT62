<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../include/header.jsp"/>

<div id="registrationPageBackground" class="grid-container">
    <div class="container container-form" >
        <form action="${pageContext.request.contextPath}/order/addToCart/${productId}" method="post">
            <input type="hidden" name="productId" value="${productId}">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="editOrderForm">
                <input type="text"
                       value="${form.bookingDate}"
                       name="bookingDate"
                       placeholder="Date (yyyy-MM-dd)"
                       id="bookingDate"
                       style="width:50%"
                >
                <label class="label-form" for="bookingDate">Booking date</label>
            </div>

            <div class="editOrderForm">
            <input type="text"
                   value="${form.numberOfPax}"
                   name="numberOfPax"
                   placeholder="# of people"
                   id="numberOfPax"
                   style="width:50%"
            >
                <label class="label-form" for="numberOfPax">Number of Pax</label>
            </div>
            <div class="editOrderForm">
            <input type="text"
                   value="${form.durationHours}"
                   name="durationHours"
                   placeholder="Duration (# hours)"
                   id="durationHours"
                   style="width:50%"
            >
            <label class="label-form" for="durationHours">Duration in Hours</label>
            </div>

            <div class="editOrderForm">
            <input type="text"
                   value="${form.quantityOrdered}"
                   name="quantityOrdered"
                   placeholder="Quantity (type a #)"
                   id="quantityOrdered"
                   style="width:50%"
            >
            <label class="label-form" for="quantityOrdered">Quantity</label>
            </div>
            <div style="display: flex; justify-content: center">
                <button class="editOrderButton" type="submit">Edit</button>
            </div>
        </form>
    </div>
</div>
<jsp:include page="../include/footer.jsp"/>
