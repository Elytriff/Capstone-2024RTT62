<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="include/header.jsp" />
<!--------------------------------------------Carusel Section--------------------------------->

<section>
    <div class="container">
        <div class="carousel">
            <input type="radio" name="slides" checked="checked" id="slide-1">
            <input type="radio" name="slides" id="slide-2">
            <input type="radio" name="slides" id="slide-3">
            <input type="radio" name="slides" id="slide-4">
            <ul class="carousel__slides">

                <li class="carousel__slide">
                    <figure>
                        <div>
                            <img src="${pageContext.request.contextPath}/pub/images/places/Viñales/View Point.JPG" alt="Viñales Valley">
                        </div>
                        <figcaption id="viñalesViewPoint">
                            <!------------------------------------------figcaption here ----------------->
                            <jsp:include page="include/bookVinalesTour.jsp" />

                        </figcaption>
                    </figure>
                </li>

                <li class="carousel__slide">
                    <figure>
                        <div>
                            <img src="${pageContext.request.contextPath}/pub/images/places/Viñales/Inside a Vega.JPG" alt="Tabaco Vega">
                        </div>
                        <figcaption id="tabacoVega">

                            <!------------------------------------------figcaption here ----------------->
                            <jsp:include page="include/bookVinalesTour.jsp" />

                        </figcaption>
                    </figure>
                </li>

                <li class="carousel__slide">
                    <figure>
                        <div>
                            <img src="${pageContext.request.contextPath}/pub/images/places/Viñales/Viñales Cave.JPG" alt="Viñales Cave">
                        </div>
                        <figcaption id="viñalesCave">

                            <!------------------------------------------figcaption here ----------------->
                            <jsp:include page="include/bookVinalesTour.jsp" />

                        </figcaption>
                    </figure>
                </li>

                <li class="carousel__slide">
                    <figure>
                        <div>
                            <img src="${pageContext.request.contextPath}/pub/images/places/Viñales/Viñales Valley.JPG" alt="Viñales Valley">
                        </div>
                        <figcaption id="viñalesValley">
                            <!------------------------------------------figcaption here ----------------->
                            <jsp:include page="include/bookVinalesTour.jsp" />
                        </figcaption>
                    </figure>
                </li>

            </ul>
            <ul class="carousel__thumbnails">
                <li>
                    <label for="slide-1"><img src="${pageContext.request.contextPath}/pub/images/places/Viñales/View Point.JPG" alt="Viñales Valley"></label>
                </li>
                <li>
                    <label for="slide-2"><img src="${pageContext.request.contextPath}/pub/images/places/Viñales/Inside a Vega.JPG" alt="Tabaco Vega"></label>
                </li>
                <li>
                    <label for="slide-3"><img src="${pageContext.request.contextPath}/pub/images/places/Viñales/Viñales Cave.JPG" alt="Viñales cave"></label>
                </li>
                <li>
                    <label for="slide-4"><img src="${pageContext.request.contextPath}/pub/images/places/Viñales/Viñales Valley.JPG" alt="Viñales Valley"></label>
                </li>
            </ul>
        </div>
    </div>
</section>

<jsp:include page="include/footer.jsp" />