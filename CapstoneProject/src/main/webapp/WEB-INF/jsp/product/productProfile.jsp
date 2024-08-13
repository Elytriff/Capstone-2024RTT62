<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../include/header.jsp"/>

<div id="registrationPageBackground" class="grid-container">
    <div class="container container-form">
        <!-- ------------------Name -------------------->
        <h2>${product.productName}</h2>

        <table id="profileTable">
            <!-- ------------------product type -------------------->
            <tr>
                <td style="font-weight: bolder;">Product type:</td>
                <td>${product.productType}</td>
            </tr>
            <!-- ------------------Location -------------------->
            <tr>
                <td style="font-weight: bolder;">Location:</td>
                <td>${product.location}</td>
            </tr>
            <!-- -------------Capacity -------------------->
            <tr>
                <td style="font-weight: bolder;">Capacity:</td>
                <td>${product.capacity}</td>
            </tr>
            <!-- ---------- Color-------------------->
            <tr>
                <td style="font-weight: bolder;">Color :</td>
                <td>${product.color}</td>
            </tr>
            <!-- ---------- Air Conditioner-------------------->
            <tr>
                <td style="font-weight: bolder;">Air Conditioner :</td>
                <td>${product.airConditioner}</td>
            </tr>
            <!-- ---------- Description-------------------->
            <tr>
                <td style="font-weight: bolder;">Description :</td>
                <td>${product.description}</td>
            </tr>
            <!-- ---------- Duration in hours-------------------->
            <tr>
                <td style="font-weight: bolder;">Duration in hours :</td>
                <td>${product.durationInHours}</td>
            </tr>
            <!-- ---------- Difficulty-------------------->
            <tr>
                <td style="font-weight: bolder;">Difficulty :</td>
                <td>${product.difficulty}</td>
            </tr>
            <!-- ---------- Price /Pax /Hour-------------------->
            <tr>
                <td style="font-weight: bolder;">Price /Pax /Hour :</td>
                <td>${product.pricePerPaxPerHour}</td>
            </tr>

            <!-- ---------- Image URL-------------------->
            <tr>
                <td style="font-weight: bolder;">Image URL :</td>
                <td>${product.imageUrl}</td>
            </tr>


        </table>
        <!-- -------------------------------------------Edit Button -------------------->
        <div style="text-align: center">
            <a class="aEdit" href="${pageContext.request.contextPath}/editProduct?id=${product.id}">Edit</a><span> / </span>
            <a class="aEdit" href="${pageContext.request.contextPath}/deleteProduct?productId=${product.id}">Delete</a> <span> / </span>
            <a class="aEdit"
               style="color: red"
               href="${pageContext.request.contextPath}/productProfile${product.id}">Cancel</a>
        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"/>