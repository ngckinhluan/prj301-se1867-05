
<link rel="stylesheet" href="./css/template.css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Flight booking</title>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/stylesBootstrap.css" rel="stylesheet" />
        <!-- Datatables CSS -->
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    </head>

    <body>
        <jsp:include page="/header.jsp" />

        <!-- Section-->
        <section class="">

            <div class="container px-4 px-lg-5 ">
                <h2 style="margin-bottom: 50px">Available Flights</h2>
                <table class="table table-hover table-bordered border rounded " id="datatable">

                    <thead >
                        <tr>
                            <th>Flight ID</th>
                            <th>Seats Left</th>
                            <th>Departure Time</th>
                            <th>From</th>
                            <th>To</th> 
                            <th>Arrival Time</th>
                            <th>Book Tickets</th>
                            <th>Number Tickets</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${FlightList}" var="Flight">
                            <c:if test="${Flight.seats > 0}">
                                <tr>
                                    <td>${Flight.getId()}</td>
                                    <td>${Flight.seats}</td>
                                    <td>${Flight.departureTime}</td>
                                    <td>${Flight.source}</td>
                                    <td>${Flight.destination}</td>
                                    <td>${Flight.arrivalTime}</td>
                                    <th>
                                        <a href="#" onclick="book(${Flight.getId()})">Book Now</a>
                                    </th>
                                    <th>
                                        <input id="number-${Flight.getId()}" type="number" name="numberTicket" min="1" value="1">
                                    </th>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>

                <script>
                    function book(id) {
                        let numberSeat = document.getElementById('number-' + id).value;
                        window.location.href = './bookdetail?id=' + id + '&numberTicket=' + numberSeat;
                    }
                </script>

            </div>
        </section>

    </body>

    <!-- Footer -->
    <footer class="footer">
        <div class="section__container footer__container">
            <div class="footer__col">
                <h3>Fire Airlines</h3>
                <p>
                    Where Excellence Takes Flight. With a strong commitment to customer
                    satisfaction and a passion for air travel, Fire Airlines offers
                    exceptional service and seamless journeys.
                </p>
                <p>
                    From friendly smiles to state-of-the-art aircraft, we connect the
                    world, ensuring safe, comfortable, and unforgettable experiences.
                </p>
            </div>
            <div class="footer__col">
                <h4>PRIVACY AND SECURITY</h4>
                <p>Pledge to donor</p>
                <p>Privacy policy</p>
                <p>Social media policy</p>
                <p>Copyright Notice</p>
            </div>
            <div class="footer__col">
                <h4>CONTACT</h4>
                <p>Support: <a href="#">Ngoc Kinh Luan Tran</a></p>
                <p>Media: <a href="#">Ha Linh Nguyen</a></p>
                <p>Socials: <a href="#">Thanh Dat Tran</a></p>
                <p>Hotline: 0332748225</p>
            </div>
        </div>
        <div class="section__container footer__bar">
            <p>Safe flight happy life</p>
            <div class="socials">
                <span><i class="ri-facebook-fill"></i></span>
                <span><i class="ri-twitter-fill"></i></span>
                <span><i class="ri-instagram-line"></i></span>
                <span><i class="ri-youtube-fill"></i></span>
            </div>
        </div>
    </footer>
    
    <!-- Datatables JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>

    <script>
                    $(document).ready(function () {
                        $('#datatable').DataTable();
                    });
    </script>


</body>

</html>