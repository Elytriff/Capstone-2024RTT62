
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
                        <span>
                        <div>
                            <img src="${pageContext.request.contextPath}/pub/images/cars/laNave.JPG" alt="Blue Chevy">
                        </div>
                        </span>
                        <span  class="desccription">
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
                        </span>
                        <!------------------------------------------Form Blue Chevy ----------------->
                            <div class ="figcaptionForm" style="width: 30%; padding-left: 15px">
                                <div  action="${pageContext.request.contextPath}/order/addToCart">
                                    <input type="hidden" name="productId" value="4">

                                    <input type="text"
                                           value="${form.bookingDate}"
                                           name="bookingDate"
                                           placeholder="Date (yyyy-MM-dd)"
                                    >
                                    <div style="padding-bottom: 10px">
                                    <select name="numberOfPax" style="padding-bottom: 6px; padding-top: 6px; border-radius: 5px; color: rgb(117, 76, 36);">
                                        <option value="" disabled selected> # of passengers</option>
                                        <option value="1" ${form.numberOfPax == 1 ? 'selected' : ''}>1</option>
                                        <option value="2" ${form.numberOfPax == 2 ? 'selected' : ''}>2</option>
                                        <option value="3" ${form.numberOfPax == 3 ? 'selected' : ''}>3</option>
                                        <option value="4" ${form.numberOfPax == 4 ? 'selected' : ''}>4</option>
                                    </select>
                                    </div>

                                    <input type="text"
                                           value="${form.durationHours}"
                                           name="durationHours"
                                           placeholder="Duration (# hours)"
                                    >
                                    <input type="text"
                                           value="${form.quantityOrdered}"
                                           name="quantityOrdered"
                                           placeholder="Quantity (type a #)"
                                    >
                                    <div>
                                        <button class = "makeReservationButton" type="submit">Add to cart</button>
                                    </div>
                                </form>
                                <div id="bookingError"></div>
                            </div>
                    </figure>
                </li>

                <li class="carousel__slide">
                    <figure>
                        <span>
                        <div>
                            <img src="${pageContext.request.contextPath}/pub/images/cars/GoldenChevy.jpg" alt="Golden Chevy">
                        </div>
                        </span>
                        <!------------------------------------------Table Golden Chevy ----------------->
                        <span  class="desccription">
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
                        </span>
                        <!------------------------------------------Form Golden Chevy----------------->
                            <div class ="figcaptionForm" style="width: 30%; padding-left: 15px">
                                <form  action="${pageContext.request.contextPath}/order/addToCart">
                                    <input type="hidden" name="productId" value="5">

                                    <input type="text"
                                           value="${form.bookingDate}"
                                           name="bookingDate"
                                           placeholder="Date (yyyy-MM-dd)"
                                    >
                                    <div style="padding-bottom: 10px">
                                    <select name="numberOfPax" style="padding-bottom: 6px; padding-top: 6px; border-radius: 5px; color: rgb(117, 76, 36);">
                                        <option value="" disabled selected> # of passengers</option>
                                        <option value="1" ${form.numberOfPax == 1 ? 'selected' : ''}>1</option>
                                        <option value="2" ${form.numberOfPax == 2 ? 'selected' : ''}>2</option>
                                        <option value="3" ${form.numberOfPax == 3 ? 'selected' : ''}>3</option>
                                        <option value="4" ${form.numberOfPax == 4 ? 'selected' : ''}>4</option>
                                    </select>
                                    </div>
                                    <input type="text"
                                           value="${form.durationHours}"
                                           name="durationHours"
                                           placeholder="Duration (# hours)"
                                    >
                                    <input type="text"
                                           value="${form.quantityOrdered}"
                                           name="quantityOrdered"
                                           placeholder="Quantity (type a #)"
                                    >
                                    <div>
                                        <button class = "makeReservationButton" type="submit">Add to cart</button>
                                    </div>
                                </form>
                                <div id="bookingError"></div>
                            </div>
                    </figure>
                </li>

                <li class="carousel__slide">
                    <figure>
                        <span>
                        <div>
                            <img src="${pageContext.request.contextPath}/pub/images/cars/GreenCar.jpg" alt="Green Ford 52">
                        </div>
                        </span>
                        <!------------------------------------------Table Green Car ----------------->
                        <span  class="desccription">
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
                        </span>
                        <!------------------------------------------Form Green Car ----------------->
                            <div class ="figcaptionForm" style="width: 30%; padding-left: 15px">
                                <form  action="${pageContext.request.contextPath}/order/addToCart">
                                    <input type="hidden" name="productId" value="6">

                                    <input type="text"
                                           value="${form.bookingDate}"
                                           name="bookingDate"
                                           placeholder="Date (yyyy-MM-dd)"
                                    >
                                    <div style="padding-bottom: 10px">
                                    <select name="numberOfPax" style="padding-bottom: 6px; padding-top: 6px; border-radius: 5px; color: rgb(117, 76, 36);">
                                        <option value="" disabled selected> # of passengers</option>
                                        <option value="1" ${form.numberOfPax == 1 ? 'selected' : ''}>1</option>
                                        <option value="2" ${form.numberOfPax == 2 ? 'selected' : ''}>2</option>
                                        <option value="3" ${form.numberOfPax == 3 ? 'selected' : ''}>3</option>
                                        <option value="4" ${form.numberOfPax == 4 ? 'selected' : ''}>4</option>
                                    </select>
                                    </div>
                                    <input type="text"
                                           value="${form.durationHours}"
                                           name="durationHours"
                                           placeholder="Duration (# hours)"
                                    >
                                    <input type="text"
                                           value="${form.quantityOrdered}"
                                           name="quantityOrdered"
                                           placeholder="Quantity (type a #)"
                                    >
                                    <div>
                                        <button class = "makeReservationButton" type="submit">Add to cart</button>
                                    </div>
                                </form>
                                <div id="bookingError"></div>
                            </div>
                    </figure>
                </li>

                <li class="carousel__slide">
                    <figure>
                        <span>
                        <div>
                            <img src="${pageContext.request.contextPath}/pub/images/cars/redCar.jpg" alt="Red Buick">
                        </div>
                        </span>
                        <!------------------------------------------Table Red Buick ----------------->
                        <span  class="desccription">
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
                        </span>
                        <!------------------------------------------Form Red Buick ----------------->

                            <div class ="figcaptionForm" style="width: 30%; padding-left: 15px">
                                <form  action="${pageContext.request.contextPath}/order/addToCart">
                                    <input type="hidden" name="productId" value="7">

                                    <input type="text"
                                           value="${form.bookingDate}"
                                           name="bookingDate"
                                           placeholder="Date (yyyy-MM-dd)"
                                    >
                                    <div style="padding-bottom: 10px">
                                    <select name="numberOfPax" style="padding-bottom: 6px; padding-top: 6px; border-radius: 5px; color: rgb(117, 76, 36);">
                                        <option value="" disabled selected> # of passengers</option>
                                        <option value="1" ${form.numberOfPax == 1 ? 'selected' : ''}>1</option>
                                        <option value="2" ${form.numberOfPax == 2 ? 'selected' : ''}>2</option>
                                        <option value="3" ${form.numberOfPax == 3 ? 'selected' : ''}>3</option>
                                        <option value="4" ${form.numberOfPax == 4 ? 'selected' : ''}>4</option>
                                    </select>
                                    </div>

                                    <input type="text"
                                           value="${form.durationHours}"
                                           name="durationHours"
                                           placeholder="Duration (# hours)"
                                    >
                                    <input type="text"
                                           value="${form.quantityOrdered}"
                                           name="quantityOrdered"
                                           placeholder="Quantity (type a #)"
                                    >
                                    <div>
                                        <button class = "makeReservationButton" type="submit">Add to cart</button>
                                    </div>
                                </form>
                                <div id="bookingError"></div>
                            </div>
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