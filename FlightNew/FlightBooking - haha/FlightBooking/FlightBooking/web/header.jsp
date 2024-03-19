<%-- 
    Document   : header
    Created on : Oct 21, 2023, 9:53:40 AM
    Author     : anhdu
--%>
<link rel="stylesheet" href="./css/header_style.css">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Navigation-->
<div class="header">
    <div class="img">  
        <c:if test="${sessionScope.user.role == 1 ||  empty sessionScope.user}">
            <a class="menu" aria-current="page" href="home"><img class="logo" src="./images/logo.png"></a></c:if>
            <c:if test="${sessionScope.user.role == 0}">
            <a class="menu" aria-current="page" href="#"><img class="logo" src="./images/logo.png"></a></c:if>
        </div>
        <div class="bar">
                             
            <c:if test="${not empty sessionScope.user && (sessionScope.user.role==0)}">
<!--                 <a class="menu" aria-current="page" href="home">HOME</a>  -->
                <a class="menu" aria-current="page" href="AdminUser">USERS</a>
                <a class="menu" aria-current="page" href="AdminFlight">FLIGHTS</a>
                <a class="menu" aria-current="page" href="AdminTicket">TICKETS</a>
            </c:if>
        </div>
    <div class="other_func">
            <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <c:if test="${(sessionScope.user.role==1)}">
                        <a class="btn btn-outline-dark" href="booked">
                            <i class="bi-clock me-1"></i>
                            Booked list
                        </a>
                        </c:if>
                        <a class="btn btn-outline-dark ms-3" href="profile">
                            <i class="bi-person me-1"></i>
                            Welcome, ${user.username}
                        </a>
                        
                        <a class="btn btn-outline-dark ms-3" href="log">
                            <i class="bi-box-arrow-right me-1"></i>
                            Log out
                        </a>
                    </c:when>
                    
                    
                    <c:otherwise>
                        <a class="btn btn-outline-dark ms-3" href="login.jsp">
                            <i class="bi-person me-1"></i>
                            Login
                        </a>
                    </c:otherwise>
                </c:choose>
        </div>
</div>

<!-- Header-->
<header class="section__container header__container">
      <h1 class="section__header">Find And Book<br />A Great Experience</h1>
      <img class="img-header" src="./images/header.jpg" alt="header" />
</header>
