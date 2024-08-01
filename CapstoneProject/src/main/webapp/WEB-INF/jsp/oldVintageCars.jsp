<%--
  Created by IntelliJ IDEA.
  User: oscar
  Date: 8/1/2024
  Time: 10:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="include/header.jsp" />

<!-----------------------------Carrusel Section ------------------------------------>
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
                            <img src="/pub/images/cars/laNave.JPG" alt="Blue Chevy">
                        </div>
                        <figcaption id="laNave">
                            <!------------------------------------------Table BLue Chevy ----------------->

                            <div class="table-responsive" id="BlueChevyTable">
                                <table class="table" style="width: auto; table-layout: auto;">
                                    <thead>
                                    <tr>
                                        <th scope="col" colspan="2" style="text-align: center;">Characteristics</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th scope="row">Model</th>
                                        <td>Chevrolet 55</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Color</th>
                                        <td>Blue</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Air conditioner</th>
                                        <td>yes</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Passengers</th>
                                        <td>4</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                        </figcaption>
                    </figure>
                </li>

                <li class="carousel__slide">
                    <figure>
                        <div>
                            <img src="/pub/images/cars/GoldenChevy.jpg" alt="Golden Chevy">
                        </div>
                        <figcaption id="GoldenChevy">

                            <!------------------------------------------Table Golden Chevy ----------------->

                            <div class="table-responsive" id="GoldenChevyTable">
                                <table class="table" style="width: auto; table-layout: auto;">
                                    <thead>
                                    <tr>
                                        <th scope="col" colspan="2" style="text-align: center;">Characteristics</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th scope="row">Model</th>
                                        <td>Ford 56</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Color</th>
                                        <td>Golden & White</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Air conditioner</th>
                                        <td>yes</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Passengers</th>
                                        <td>4</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                        </figcaption>
                    </figure>
                </li>

                <li class="carousel__slide">
                    <figure>
                        <div>
                            <img src="images/Cars/GreenCar.jpg" alt="Green Ford 52">
                        </div>
                        <figcaption id="GreenCar">

                            <!------------------------------------------Table Green Car ----------------->

                            <div class="table-responsive" id="GreenCarTable">
                                <table class="table" style="width: auto; table-layout: auto;">
                                    <thead>
                                    <tr>
                                        <th scope="col" colspan="2" style="text-align: center;">Characteristics</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th scope="row">Model</th>
                                        <td>Ford 52</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Color</th>
                                        <td>Green</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Air conditioner</th>
                                        <td>yes</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Passengers</th>
                                        <td>4</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                        </figcaption>
                    </figure>
                </li>

                <li class="carousel__slide">
                    <figure>
                        <div>
                            <img src="images/Cars/redCar.jpg" alt="Red Buick">
                        </div>
                        <figcaption id="redCar">
                            <!------------------------------------------Table Red Buick ----------------->

                            <div class="table-responsive" id="redCarTable">
                                <table class="table" style="width: auto; table-layout: auto;">
                                    <thead>
                                    <tr>
                                        <th scope="col" colspan="2" style="text-align: center;">Characteristics</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th scope="row">Model</th>
                                        <td>Buick</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Color</th>
                                        <td>Red</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Air conditioner</th>
                                        <td>No</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Passengers</th>
                                        <td>4</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </figcaption>
                    </figure>
                </li>

            </ul>
            <ul class="carousel__thumbnails">
                <li>
                    <label for="slide-1"><img src="${pageContext.request.contextPath}/pub/images/cars/laNave.JPG" alt="Blue Chevy"></label>
                </li>
                <li>
                    <label for="slide-2"><img src="${pageContext.request.contextPath}/pub/images/cars/GoldenChevy.jpg" alt="Golden Chevy"></label>
                </li>
                <li>
                    <label for="slide-3"><img src="${pageContext.request.contextPath}/pub/images/cars/GreenCar.jpg" alt="Green Ford"></label>
                </li>
                <li>
                    <label for="slide-4"><img src="${pageContext.request.contextPath}/pub/images/cars/redCar.jpg" alt="Red Buick"></label>
                </li>
            </ul>
        </div>
    </div>
</section>


<jsp:include page="include/footer.jsp" />