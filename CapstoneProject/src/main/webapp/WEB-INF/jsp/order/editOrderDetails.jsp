
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



</div>
<form  action="${pageContext.request.contextPath}/order/addToCart">
        <input type="hidden" name="orderId" value="${orderDetail.orderId}">
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
        <button class = "makeReservationButton" type="submit">Edit</button>
    </div>
</form>
</div>
<jsp:include page="../include/footer.jsp"/>
