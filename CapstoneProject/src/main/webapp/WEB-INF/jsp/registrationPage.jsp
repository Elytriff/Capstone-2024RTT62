<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="include/header.jsp"/>

<!--------------------------------------------------------------------Registration form-------------------->


<div id="registrationPageBackground" class="grid-container">
    <div class="container container-form">
        <h2>Create an account</h2>
        <form action="${pageContext.request.contextPath}/customer/registerCustomer" method="post">
            <input type="hidden" name="id" value="${form.id}">
            <!-- -------------------------------Firstname-------------------->
            <div class="row row-form">
                <div class="column column-form">
                    <input
                            type="text"
                            id="name"
                            name="name"
                            value="${form.name}"
                    />
                    <label for="name">First name</label>
                    <div id="firstNameHelp"></div>
                </div>
                <!-- ------------------------------Lastname -------------------->
                <div class="column column-form">
                    <input
                            type="text"
                            id="lastName"
                            name="lastName"
                            value="${form.lastName}"
                    />
                    <label for="lastName">Last name</label>
                    <div id="lastNameHelp"></div>
                </div>
            </div>
            <!-- ------------------Country and City -------------------->
            <div class="row row-form">
                <div class="column column-form">
                    <input
                            type="text"
                            id="country"
                            name="country"
                            value="${form.country}"
                    />
                    <label for="country">Country</label>
                    <div id="countryHelp"></div>
                </div>
                <div class="column column-form">
                    <input
                            type="text"
                            id="city"
                            name="city"
                            value="${form.city}"
                    />
                    <label for="city">City</label>
                    <div id="cityHelp"></div>
                </div>
            </div>
            <!-- -------------------------------------Email and phone-------------------->
            <div class="row row-form">
                <div class="column column-form">
                    <input
                            type="email"
                            id="email"
                            name="email"
                            value="${form.email}"
                    />
                    <label for="email" class="label-form">Contact Email</label>
                    <div id="emailHelp"></div>
                </div>
                <div class="column column-form">
                    <input
                            type="text"
                            id="phone"
                            name="contactNumber"
                            value="${form.contactNumber}"
                    />
                    <label for="phone" class="label-form">Phone number</label>
                    <div id="phoneHelp"></div>
                </div>
            </div>
            <!-- ------------------------------------------Password -------------------->
            <div class="email-password-divs">
                <input
                        type="password"
                        id="password"
                />
                <label class="label-form" for="password">Password</label>
                <div id="passwordHelp"></div>
            </div>
            <div class="email-password-divs">
                <input
                        type="password"
                        id="repeatPassword"
                        name="password"
                        value="${form.password}"
                />
                <label for="repeatPassword" class="label-form">Repeat your password</label>
                <div id="repeatPasswordHelp"></div>
            </div>
            <!-- ----------------------------------------Terms of service -------------------->
            <div style="padding: 25px; display: inline-block;">
                <input type="checkbox" value="" id="termsOfService" required/>
                <label for="termsOfService" class="termsOfService-label">
                    I agree all statements in <a href="#" class="aclass"><u>Terms of service</u></a>
                </label>
            </div>
            <!-- -------------------------------------------Register Button and Log in link-------------------->
            <div class="register-button">
                <button type="submit" onclick="onSubmitRegistration()">Register</button>
            </div>

            <p>Have already an account? <a href="#" class="aclass" style="margin-left: 8px;"><u>Login here</u></a></p>

        </form>
    </div>
</div>


<jsp:include page="include/footer.jsp"/>