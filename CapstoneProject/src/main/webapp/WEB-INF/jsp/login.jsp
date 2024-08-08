<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="include/header.jsp"/>

<div id="registrationPageBackground" class="grid-container">
    <div class="container container-form">
        <h2>Log in</h2>

        <c:if test="${param['error'] eq ''}">
            <div class="row pt-5 justify-content-center">
                <div class="col-6">
                    <div class="alert alert-danger" role="alert">Invalid Username or Password</div>
                </div>
            </div>
        </c:if>
        <form action="${pageContext.request.contextPath}/account/loginProcessingURL" method="post">
            <!-- ------------------------------email input----------------------- -->
            <div class="email-password-divs">
                <input
                        type="text"
                        id="username"
                        name="username"
                        <c:if test="${bindingResult.hasFieldErrors('email')}"> </c:if>
                         value="${form.email}"
                />
                <label for="username" class="label-form">Email</label>
            </div>
            <c:if test="${bindingResult.hasFieldErrors('email')}">
                <div class="row align-items-center justify-content-center">
                    <div class="offset-2 col-4">
                        <div class="text-danger">
                            <c:forEach items="${bindingResult.getFieldErrors('email')}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:if>


            <!-- ------------------------------password input----------------------- -->
            <div class="email-password-divs">
                <input
                        type="password"
                        id="PasswordLogin"
                        name="password"
                        <c:if test="${bindingResult.hasFieldErrors('password')}"> </c:if>
                        value="${form.password}"
                />
                <label for="PasswordLogin" class="label-form">Password</label>
            </div>
            <c:if test="${bindingResult.hasFieldErrors('password')}">
                <div class="row align-items-center justify-content-center">
                    <div class="offset-2 col-4">
                        <div style="color:red">
                            <c:forEach items="${bindingResult.getFieldErrors('password')}" var="error">
                                ${error.defaultMessage}<br>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:if>
            <!-- ------------------------------Log in Button----------------------- -->
            <div class="register-button">
                <button type="submit" >Log in</button>
            </div>

        </form>

    </div>
</div>
<jsp:include page="include/footer.jsp"/>