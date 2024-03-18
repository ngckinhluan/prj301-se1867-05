<%-- 
    Document   : login
    Created on : Sep 29, 2023, 11:14:41 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/stylelog3.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">"
        <title>Log</title>
    </head>
    <body>
        <c:set var="cookie" value="${pageContext.request.cookies}"/>
        <div class="wrapper">
            <nav class="nav">
                <div class="nav-logo">
                    <a href="home"> <img src="./images/logo.png" alt=""></a>  
                </div>
                <div class="nav-menu" id="navMenu">

                </div>
                
                <div class="nav-menu-btn">
                    <i id="navMenuBtn" class="bx bx-menu" onclick="myMenuFunction()"></i>
                </div>
            </nav>
            <!------------------------------------FORM BOX------------------------------------------->
            <div style="color: #E83C38;
                 font-size: 20px;
                 margin-right: 150px;
                 margin-left: 71px;
                "><h1>Hello, Friend !</h1><br>
                <h2>Welcome to Fire Airlines! 🔥 🔥 🔥</h2>
            </div>
            <div class="form-box" style="left: -105px;">

                <!----------------------------------LOGIN------------------------------------------>
                <div class="login-container" id="login">
                    <form action="log" method="post">
                        <div class="top">
                            <span>Don't have an account? <a href="#" onclick="register()">Sign up</a></span>
                            <header ><h3>Log In</h3></header>
                        </div>	
                        <div class="top" style="color: red">
                            <span>${err}</span>
                        </div>	
                        <div class="input-box">
                            <input type="text" name="username" class="input-field" placeholder="Username or Email" value="${username == null ? cookie.username.value : username}">
                            <i class="bx bx-user"></i>
                        </div>
                        <div class="input-box">
                            <input type="password" name="password" class="input-field" placeholder="Password" value="${password == null ? cookie.password.value : password}">
                            <i class="bx bx-lock-alt"></i>
                        </div>
                        <div class="successMsg input-field-error" style="display: none;color: black; background-color: rgba(255, 255, 255, 0.7); padding: 10px; margin-bottom: 20px; border-radius: 30px;">
                            ${successMsg}
                        </div>
                        <div class="input-box">
                            <input type="submit" class="submit" value="Sign in"/>
                        </div>

                        <div class="two-col">
                            <div class="one">
                                <input type="checkbox" name="remember" id="login-check" ${cookie.remember != null ? 'checked' : ''}>
                                <label for="login-check">Remember me</label>
                            </div>

                            <div class="two">
                                <label><a href="forgot">Forgot password?</a></label>
                            </div>
                        </div>
                    </form>
                </div>

                <!----------------------------------REGISTER------------------------------------------>
                <div class="register-container" id="register">
                    <form action="signup" method="post">
                        <div class="top">
                            <span>Have an account? <a href="#" onclick="login()">Login</a></span>
                            <header><h3>Sign Up</h3></header>
                        </div>

                        <div class="two-forms">
                            <div class="input-box" style="width: 50%;">
                                <input type="text" name="fullname"  class="input-field" placeholder="Fullname" required value="${param.fullname}">
                                <i class="bx bx-user"></i>
                            </div>
                            <div  style="width: 50%;" class="input-box">
                                <select class="condition" name="gender" required>
                                    <option value="Male" ${param.gender == 'Male' ? 'selected' : ''}>Male</option>
                                    <option value="Female" ${param.gender == 'Female' ? 'selected' : ''}>Female</option>
                                </select>
                                <i class="bx bx-male-female"></i>
                            </div>
                        </div>
                        <div class="input-box">
                            <c:set var="errorType1" value="${errorMsg.contains('username')}"/>
                            <input type="text" name="newusername" class="input-field ${errorType1 ? 'input-field-error' : ''}" placeholder="Username" required value="${param.newusername}">
                            <i class="bx bx-user"></i>
                        </div>
                        <div class="two-forms">
                            <c:set var="errorType2" value="${errorMsg.contains('Password')}"/>
                            <div class="input-box" style="width: 50%;">
                                <input type="password" name="newpassword" class="input-field ${errorType2 ? 'input-field-error' : ''}" placeholder="Password" required value="${param.newpassword}">
                                <i class="bx bx-lock-alt"></i>
                            </div>
                            <div class="input-box" style="width: 50%;">
                                <input type="password" name="repass"  class="input-field ${errorType2 ? 'input-field-error' : ''}" placeholder="Re-Password" required value="${param.repass}">
                                <i class="bx bx-lock-alt"></i>
                            </div>
                        </div>
                        <div class="input-box">
                            <c:set var="errorType3" value="${errorMsg.contains('email')}"/>
                            <input type="text" name="newemail"  class="input-field ${errorType3 ? 'input-field-error' : ''}" placeholder="Email" required value="${param.newemail}">
                            <i class="bx bx-envelope"></i>
                        </div>
                        <div class="input-box">
                            <input type="date" name="dob" id="dob" class="input-field" placeholder="Dob" value="${param.dob}" >
                            <i class="bx bx-user"></i>
                        </div>
                        <c:if test="${not empty errorMsg}">
                            <div class="errorMsg"  style="color: red; background-color: rgba(255, 255, 255, 0.7); padding: 10px; margin-bottom: 20px; border-radius: 30px;">
                                ${errorMsg}
                            </div>
                        </c:if>
                        <div class="input-box">
                            <input type="submit" class="submit" value="REGISTER"/>
                        </div>

                    </form>
                </div>

            </div>
        </div>

        <script>
            //button login
            var a = document.getElementById('loginBtn');
            //button register
            var b = document.getElementById('registerBtn');
            //form login
            var x = document.getElementById('login');
            //form register
            var y = document.getElementById('register');

            function login() {
                x.style.left = '15px';
                y.style.right = '-600px';
                a.className += ' white-button';
                b.className = 'btn';
                x.style.opacity = 1;
                y.style.opacity = 0;
            }

            function register() {
                x.style.left = '-600px';
                y.style.right = '5px';
                a.className = 'btn';
                b.className += ' white-button';
                x.style.opacity = 0;
                y.style.opacity = 1;
            }

            function myMenuFunction() {
                var i = document.getElementById('navMenu');
                var menuBtn = document.getElementById('navMenuBtn');
                if (i.className === 'nav-menu') {
                    i.className += ' responsive';
                    menuBtn.className = 'bx bx-x';
                } else {
                    i.className = 'nav-menu';
                    menuBtn.className = 'bx bx-menu';
                }
            }

            function displaySuccessMessage() {
                // Check if success message is present and not empty
                var successMsg = "${successMsg}";
                if (successMsg && successMsg.trim() !== "") {
                    // Display the success message
                    document.querySelector(".successMsg").innerText = successMsg;
                    document.querySelector(".successMsg").style.display = "block";
                }
            }
            var successMsg = "${successMsg}";
            if (successMsg && successMsg.trim() !== "") {
                displaySuccessMessage(successMsg);
            }

            // Check if errorMsg is not empty
            var errorMsg = "${errorMsg}";
            if (errorMsg.trim() !== "") {
                // Function to switch to the register form when an error message is received
                register();
            }
            const currentDate = new Date();
            const dateFormat = currentDate.toISOString().split('T')[0];
            document.getElementById('dob').setAttribute('max', dateFormat);
        </script>
    </body>
</html>
