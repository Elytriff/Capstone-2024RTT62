<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<jsp:include page="include/header.jsp"/>

<div id="registrationPageBackground" class="grid-container">
    <div class="container container-form">
        <h2>create product page</h2>
        <form action="/createProduct">
            <div class="column column-form">
            <input type="hidden" name="id" value="${form.id}">
                <label for="id">Product Id</label>
            </div>
            <!-- -------------------------------name-------------------->
            <c:if test="${bindingResult.hasFieldErrors('productName')}">
                <div class="row">
                    <div class="col-6 mb-3">
                        <div class="text-danger">
                            <c:forEach items="${bindingResult.getFieldErrors('productName')}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:if>

            <div class="row row-form">
                <div class="column column-form">
                    <input
                            type="text"
                            id="productName"
                            name="productName"
                            value="${form.productName}"
                    />
                    <label for="productName">Product Name</label>
                </div>
                <!-- ------------------------------product Type -------------------->
                <c:if test="${bindingResult.hasFieldErrors('productType')}">
                    <div class="row">
                        <div class="col-6 mb-3">
                            <div class="text-danger">
                                <c:forEach items="${bindingResult.getFieldErrors('productType')}" var="error">
                                    ${error.defaultMessage}<br>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </c:if>
                <div class="column column-form">
                    <input
                            type="text"
                            id="productType"
                            name="productType"
                            value="${form.productType}"
                    />
                    <label for="productType">Product Type</label>
                </div>
            </div>
            <!-- ------------------Location -------------------->
            <c:if test="${bindingResult.hasFieldErrors('location')}">
                <div class="row">
                    <div class="col-6 mb-3">
                        <div class="text-danger">
                            <c:forEach items="${bindingResult.getFieldErrors('location')}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:if>
            <div class="row row-form">
                <div class="column column-form">
                    <input
                            type="text"
                            id="location"
                            name="location"
                            value="${form.location}"
                    />
                    <label for="location">Location</label>
                </div>
                <!-- ------------------Capacity -------------------->
                <div class="column column-form">
                    <input
                            type="text"
                            id="capacity"
                            name="capacity"
                            value="${form.capacity}"
                    />
                    <label for="capacity">Capacity</label>
                </div>
            </div>
            <!-- -------------------------------------color-------------------->
            <div class="row row-form">
                <div class="column column-form">
                    <input
                            type="text"
                            id="color"
                            name="color"
                            value="${form.color}"
                    />
                    <label for="color" class="label-form">color </label>
                </div>

                <!-- -------------------------------------air conditioner-------------------->
                <div class="column column-form">
                    <input
                            type="text"
                            id="airConditioner"
                            name="airConditioner"
                            value="${form.airConditioner}"
                    />
                    <label for="airConditioner" class="label-form">air conditioner</label>
                </div>
            </div>
            <!-- ------------------------------------------description -------------------->
            <div class="email-password-divs">
                <input
                        type="text"
                        id="description"
                        name="description"
                        value="${form.description}"
                />
                <label for="description" class="label-form">Description</label>
            </div>
            <!-- ------------------------------------------durationInHours -------------------->
            <div class="email-password-divs">
                <input
                        type="text"
                        id="durationInHours"
                        name="durationInHours"
                        value="${form.durationInHours}"
                />
                <label for="durationInHours" class="label-form">Duration In Hours</label>
            </div>
            <!-- ------------------------------------------difficulty -------------------->
            <div class="email-password-divs">
                <input
                        type="text"
                        id="difficulty"
                        name="difficulty"
                        value="${form.difficulty}"
                />
                <label for="difficulty" class="label-form">Difficulty</label>
            </div>
            <!-- ------------------------------------------pricePerPaxPerHour -------------------->
            <div class="email-password-divs">
                <input
                        type="text"
                        id="pricePerPaxPerHour"
                        name="pricePerPaxPerHour"
                        value="${form.pricePerPaxPerHour}"
                />
                <label for="pricePerPaxPerHour" class="label-form">Price /Pax /Hour</label>
            </div>
            <!-- ------------------------------------------imageUrl -------------------->
            <div class="email-password-divs">
                <input
                        type="text"
                        id="imageUrl"
                        name="imageUrl"
                        value="${form.imageUrl}"
                />
                <label for="imageUrl" class="label-form">ImageUrl</label>
            </div>

            <!-- -------------------------------------------Create Product Button -------------------->
            <div class="register-button">
                <button type="submit">Create product</button>
            </div>
            <div class="nav-item">
                <a href=""><input type="button" value="Button Text"></a>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    function submitFormWithId() {
        var form = document.getElementById('productForm');
        var productId = document.getElementById('productId').value;

        // Verifica si el ID no está vacío
        if (productId) {
            // Redirige con el ID como parámetro
            form.action = form.action + "?id=" + encodeURIComponent(productId);
        }

        // Permite que el formulario se envíe
        return true;
    }
</script>

<jsp:include page="include/footer.jsp"/>