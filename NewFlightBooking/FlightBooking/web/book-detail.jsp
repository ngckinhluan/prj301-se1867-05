
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="./css/book_detail.css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
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
        <section class="py-5">
             <div class="container px-4 px-lg-5">
                <h2 style="margin-bottom: 50px">Book Flight Detail</h2>
                <div class="box" style="border: 1px solid; padding: 30px; border-radius: 8px; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px; border-color:gray ">
                    <h2>Project worlds Digital Ticket</h2>
                    <div class="grid-containner">
                    <div class="item1">Journey Date</div>
                    <div class="item2"><%= new Date()%></div>
                    <div class="item1">Departure at</div>
                    <div class="item2">${Flight.departureTime}</div>
                    <div class="item1">Arrive at</div>
                    <div class="item2">${Flight.arrivalTime}</div>
                    <div class="item1">Number of seats</div>
                    <div class="item2">${numberTicket}</div>
                    <div class="item1">Passenger Name</div>
                    <div class="item2">${user.fullName}</div>
                    <div class="item1">Number ticket</div>
                    <div class="item2">${numberTicket}</div>
                    
                    </div>
                </div>
                <div style="text-align: center; margin-top: 40px">
                        <a class="btn-des" href="submit?id=${Flight.id}&seatNumber=${seatId + 1}&number=${numberTicket}" style="margin-right: 50px">
                            <i class="bi-box-arrow-right me-1 btn-hover" style="line-height: 2"> Submit </i>
                           
                        </a>
                        <a class="btn-des" href="home">
                            <i class="bi-back me-1" style="line-height: 2"> Cancel </i>
                            
                        </a>
                    </div>
            </div>
        </section>
    </body>

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