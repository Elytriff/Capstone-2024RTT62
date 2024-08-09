<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../include/header.jsp"/>

<div id="registrationPageBackground" class="grid-container">
    <div class="container container-form">
        <!-- ------------------Name and Lastname -------------------->
        <h2>${customer.name} ${customer.lastName}</h2>

        <table id="profileTable">
            <!-- ------------------Email -------------------->
            <tr>
                <td style="font-weight: bolder;">Email:</td>
                <td>${customer.email}</td>
            </tr>
            <!-- ------------------Country -------------------->
            <tr>
                <td style="font-weight: bolder;">Country:</td>
                <td>${customer.country}</td>
            </tr>
            <!-- -------------City -------------------->
            <tr>
                <td style="font-weight: bolder;">City:</td>
                <td>${customer.city}</td>
            </tr>
            <!-- ---------- phone-------------------->
            <tr>
                <td style="font-weight: bolder;">Phone Number:</td>
                <td>${customer.contactNumber}</td>
            </tr>
        </table>
        <!-- -------------------------------------------Edit Button -------------------->
            <div style="text-align: center">
                <a class="aEdit" href="${pageContext.request.contextPath}/customer/edit?id=${customer.id}">Edit</a>
            </div>

    </div>
</div>
<jsp:include page="../include/footer.jsp"/>