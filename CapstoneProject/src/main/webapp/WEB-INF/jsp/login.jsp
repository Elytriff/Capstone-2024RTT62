<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="include/header.jsp"/>

<div id="registrationPageBackground" class="grid-container">
    <div class="container container-form">
        <h2>Log in</h2>
        <form>
            <div class="email-password-divs">
                <input
                        type="text"
                        id="username"
                        name="username"

                />
                <label for="PasswordLogin" class="label-form">Email</label>
                <div id="usernameHelp"></div>
            </div>
            <div class="email-password-divs">
                <input
                        type="password"
                        id="PasswordLogin"
                        name="password"

                />
                <label for="PasswordLogin" class="label-form">Password</label>
                <div id="PasswordLoginHelp"></div>
            </div>
        </form>

    </div>
</div>
<jsp:include page="include/footer.jsp"/>