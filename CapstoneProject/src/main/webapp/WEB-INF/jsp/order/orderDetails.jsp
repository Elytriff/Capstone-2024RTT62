<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../include/header.jsp"/>

<div id="registrationPageBackground" class="grid-container">
    <div class="container container-form">
        <!-- ------------------Name -------------------->
        <h2>${}</h2>

        <table id="profileTable">
            <!-- ------------------product type -------------------->
            <tr>
                <td style="font-weight: bolder;">Product type:</td>
                <td>${}</td>
            </tr>
            <!-- ------------------Location -------------------->
            <tr>
                <td style="font-weight: bolder;">Location:</td>
                <td>${}</td>
            </tr>
            <!-- -------------Capacity -------------------->
            <tr>
                <td style="font-weight: bolder;">Capacity:</td>
                <td>${}</td>
            </tr>
            <!-- ---------- Color-------------------->
            <tr>
                <td style="font-weight: bolder;">Color :</td>
                <td>${}</td>
            </tr>
            <!-- ---------- Air Conditioner-------------------->
            <tr>
                <td style="font-weight: bolder;">Air Conditioner :</td>
                <td>${}</td>
            </tr>
            <!-- ---------- Description-------------------->
            <tr>
                <td style="font-weight: bolder;">Description :</td>
                <td>${}</td>
            </tr>
            <!-- ---------- Duration in hours-------------------->
            <tr>
                <td style="font-weight: bolder;">Duration in hours :</td>
                <td>${}</td>
            </tr>
            <!-- ---------- Difficulty-------------------->
            <tr>
                <td style="font-weight: bolder;">Difficulty :</td>
                <td>${}</td>
            </tr>
            <!-- ---------- Price /Pax /Hour-------------------->
            <tr>
                <td style="font-weight: bolder;">Price /Pax /Hour :</td>
                <td>${}</td>
            </tr>

            <!-- ---------- Image URL-------------------->
            <tr>
                <td style="font-weight: bolder;">Image URL :</td>
                <td>${}</td>
            </tr>


        </table>
        <!-- -------------------------------------------Edit Button -------------------->
        <div style="text-align: center">
            <a class="aEdit" href="">Edit</a>
        </div>
    </div>
</div>
<jsp:include page="../include/footer.jsp"/>