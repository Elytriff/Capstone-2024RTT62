<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../include/header.jsp"/>


<div id="registrationPageBackground" class="grid-container">
<div class="container container-form" style="max-width: fit-content">
<!-- ------------------Name -------------------->
<table class="orderDetail">
<tr class="orderDetailTh">
    <th>Order Id</th>
    <th>Name</th>
    <th>Last Name</th>
    <th>Create date</th>
    <th>Product Id</th>
    <th>Reservation date</th>
    <th>Duration (hours)</th>
    <th>Number of people</th>
    <th>Quantity ordered</th>
    <th>Price</th>
    <th>Status</th>
    <th>Edit</th>
</tr>
<c:forEach items="${orderDetail}" var="detail">
    <tr class="orderDetailTd">
    <td>${detail.orderId}</td>
    <td>${detail.name}</td>
    <td>${detail.lastName}</td>
    <td>${detail.createDate}</td>
    <td>${detail.productId}</td>
    <td>${detail.bookingDate}</td>
    <td>${detail.durationHours}</td>
    <td>${detail.numberOfPax}</td>
    <td>${detail.quantityOrdered}</td>
    <td>${detail.totalPrice}</td>
    <td>${detail.status}</td>
        <td> <a class="aEdit" href="${pageContext.request.contextPath}/order/editOrderDetail/${detail.orderDetailId}">Edit</a></Td>
        <td> <a class="aEdit" href="${pageContext.request.contextPath}/deleteOrderDetail/${detail.orderDetailId}"> Delete</a></Td>
    </tr>
</c:forEach>
    <!-- ------------------FinalTotal -------------------->
    <tr class="orderDetailTd">
        <td colspan="9" style="text-align:right; font-weight:bold;">Total Price:</td>
        <td colspan="4">${finalTotal}</td>
    </tr>
</table>

    <jsp:include page="../include/footer.jsp"/>