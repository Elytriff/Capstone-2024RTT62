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
                        <span>
                        <div>
                            <img src="${pageContext.request.contextPath}/pub/images/places/Trinidad/Trinidad church Cuba.JPG" alt="Trinidad Church">
                        </div>
                        </span>
                        <span id="oldSquare" class="desccription">
                            <!------------------------------------------description here ----------------->
                          <div style="text-align: center">3 hours walking in <span class="havana-city">Havana City</span>...</div>
                            <br>
                           <div style="text-align: center"> ...most populous ...</div>
                            <br>
                            <div class="kalnia-glaze-description" style="text-align: center"> ...happy... </div>
                            <br>
                            <div style="text-align: center"> ...quaint neighborhoods...</div>
                            <br>
                            <div style="text-align: center"> ... <span class="lobster-regular">Old Square</span>...</div>
                        </span>
                            <!------------------------------------------figcaption here ----------------->
                            <jsp:include page="include/bookTrinidadForm.jsp" />

                    </figure>
                </li>

                <li class="carousel__slide">
                    <figure>
                        <div>
                            <img src="${pageContext.request.contextPath}/pub/images/places/Trinidad/Trinidad open stairs.JPG" alt="Trinidad Square">
                        </div>
                        <figcaption id="trinidadSquare">

                            <!------------------------------------------figcaption here ----------------->
                            <jsp:include page="include/bookTrinidadForm.jsp" />
                        </figcaption>
                    </figure>
                </li>

                <li class="carousel__slide">
                    <figure>
                        <div>
                            <img src="${pageContext.request.contextPath}/pub/images/places/Trinidad/beach in trinidad.jpg" alt="Trinidad beach">
                        </div>
                        <figcaption id="trinidadBeach">

                            <!------------------------------------------figcaption here ----------------->
                            <jsp:include page="include/bookTrinidadForm.jsp" />
                        </figcaption>
                    </figure>
                </li>

                <li class="carousel__slide">
                    <figure>
                        <div>
                            <img src="${pageContext.request.contextPath}/pub/images/places/Trinidad/Trinidad_torre.JPG" alt="Trinidad Tower">
                        </div>
                        <figcaption id="plazaCivica">
                            <!------------------------------------------figcaption here ----------------->
                            <jsp:include page="include/bookTrinidadForm.jsp" />
                        </figcaption>
                    </figure>
                </li>

            </ul>
            <ul class="carousel__thumbnails">
                <li>
                    <label for="slide-1"><img src="${pageContext.request.contextPath}/pub/images/places/Trinidad/Trinidad church Cuba.JPG" alt="Trinidad church"></label>
                </li>
                <li>
                    <label for="slide-2"><img src="${pageContext.request.contextPath}/pub/images/places/Trinidad/Trinidad open stairs.JPG" alt="Trinidad Square"></label>
                </li>
                <li>
                    <label for="slide-3"><img src="${pageContext.request.contextPath}/pub/images/places/Trinidad/beach in trinidad.jpg" alt="Trinidad beach"></label>
                </li>
                <li>
                    <label for="slide-4"><img src="${pageContext.request.contextPath}/pub/images/places/Trinidad/Trinidad_torre.JPG" alt="Trinidad Tower"></label>
                </li>
            </ul>
        </div>
    </div>
</section>

<jsp:include page="include/footer.jsp" />