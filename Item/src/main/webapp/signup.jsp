```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Create Account</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", Arial, sans-serif;
}

body {
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    background:
        radial-gradient(circle at top left, #2563eb, transparent 35%),
        radial-gradient(circle at bottom right, #06b6d4, transparent 35%),
        #0f172a;
    padding: 20px;
}

.container {
    width: 100%;
    max-width: 430px;
    padding: 40px;
    background: rgba(255, 255, 255, 0.97);
    border-radius: 24px;
    box-shadow: 0 25px 60px rgba(0, 0, 0, 0.35);
    animation: showCard 0.7s ease;
}

.logo {
    width: 65px;
    height: 65px;
    margin: 0 auto 18px;
    border-radius: 18px;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(135deg, #2563eb, #06b6d4);
    color: white;
    font-size: 30px;
    font-weight: bold;
    box-shadow: 0 10px 25px rgba(37, 99, 235, 0.35);
}

.container h2 {
    text-align: center;
    color: #0f172a;
    font-size: 30px;
    margin-bottom: 8px;
}

.subtitle {
    text-align: center;
    color: #64748b;
    font-size: 14px;
    margin-bottom: 30px;
}

.input-group {
    margin-bottom: 18px;
    position: relative;
}

.input-group label {
    display: block;
    margin-bottom: 7px;
    color: #334155;
    font-size: 14px;
    font-weight: 600;
}

.input-group input {
    width: 100%;
    padding: 14px 15px;
    border: 1px solid #cbd5e1;
    border-radius: 12px;
    outline: none;
    font-size: 15px;
    background: #f8fafc;
    transition: 0.3s;
}

.input-group input:focus {
    border-color: #2563eb;
    background: white;
    box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.12);
}

.input-group input.invalid {
    border-color: #ef4444;
    box-shadow: 0 0 0 4px rgba(239, 68, 68, 0.1);
}

.input-group input.valid {
    border-color: #22c55e;
}

.password-box {
    position: relative;
}

.password-box input {
    padding-right: 65px;
}

.show-password {
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
    border: none;
    background: none;
    color: #2563eb;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
}

.error-message {
    display: none;
    color: #ef4444;
    font-size: 12px;
    margin-top: 6px;
}

.server-error {
    padding: 12px;
    margin-bottom: 20px;
    border-radius: 10px;
    background: #fee2e2;
    color: #b91c1c;
    font-size: 14px;
    text-align: center;
}

.submit-btn {
    width: 100%;
    padding: 14px;
    margin-top: 5px;
    border: none;
    border-radius: 12px;
    background: linear-gradient(135deg, #2563eb, #06b6d4);
    color: white;
    font-size: 16px;
    font-weight: 700;
    cursor: pointer;
    transition: 0.3s;
}

.submit-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 12px 25px rgba(37, 99, 235, 0.35);
}

.submit-btn:active {
    transform: scale(0.98);
}

.submit-btn:disabled {
    opacity: 0.7;
    cursor: not-allowed;
}

.login-link {
    margin-top: 25px;
    text-align: center;
    color: #64748b;
    font-size: 14px;
}

.login-link a {
    text-decoration: none;
    color: #2563eb;
    font-weight: 700;
}

.login-link a:hover {
    text-decoration: underline;
}

@keyframes showCard {
    from {
        opacity: 0;
        transform: translateY(40px) scale(0.95);
    }

    to {
        opacity: 1;
        transform: translateY(0) scale(1);
    }
}

@media(max-width: 500px) {

    .container {
        padding: 30px 22px;
    }

    .container h2 {
        font-size: 26px;
    }
}

</style>

</head>

<body>

<div class="container">

    <div class="logo">W</div>

    <h2>Create Account</h2>

    <p class="subtitle">
        Create your eWallet account
    </p>

    <% if (request.getAttribute("error") != null) { %>

        <div class="server-error">
            <%= request.getAttribute("error") %>
        </div>

    <% } %>

    <form
        id="signUpForm"
        action="/item-serves-1/UserController"
        method="post"
        novalidate>

        <input
            type="hidden"   name="action"   value="SignUp">
          
           

        <div class="input-group">

            <label>Username</label>

            <input
                type="text"
                id="userName"
                name="userName"
                placeholder="Enter your username">

            <p class="error-message" id="userNameError">
                Username must be at least 3 characters
            </p>

        </div>


        <div class="input-group">

            <label>Password</label>

            <div class="password-box">

                <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Enter your password">

                <button
                    type="button"
                    class="show-password"
                    id="showPassword">

                    Show

                </button>

            </div>

            <p class="error-message" id="passwordError">
                Password must be at least 8 characters
            </p>

        </div>


        <div class="input-group">

            <label>Email Address</label>

            <input
                type="email"
                id="email"
                name="email"
                placeholder="example@email.com">

            <p class="error-message" id="emailError">
                Please enter a valid email
            </p>

        </div>


        <div class="input-group">

            <label>Phone Number</label>

            <input
                type="text"
                id="phoneNumber"
                name="phoneNumber"
                placeholder="Enter your phone number">

            <p class="error-message" id="phoneError">
                Phone number must contain 11 numbers
            </p>

        </div>


        <button
            type="submit"
            class="submit-btn"
            id="submitButton">

            Create Account

        </button>

    </form>


    <div class="login-link">

        Already have an account?

        <a href="login.jsp">
            Login
        </a>

    </div>

</div>


<script>

const form = document.getElementById("signUpForm");

const userName = document.getElementById("userName");
const password = document.getElementById("password");
const email = document.getElementById("email");
const phoneNumber = document.getElementById("phoneNumber");

const showPassword = document.getElementById("showPassword");
const submitButton = document.getElementById("submitButton");


function showError(input, errorId) {

    input.classList.remove("valid");
    input.classList.add("invalid");

    document.getElementById(errorId).style.display = "block";
}


function showSuccess(input, errorId) {

    input.classList.remove("invalid");
    input.classList.add("valid");

    document.getElementById(errorId).style.display = "none";
}


function validateUserName() {

    if (userName.value.trim().length < 3) {

        showError(userName, "userNameError");

        return false;
    }

    showSuccess(userName, "userNameError");

    return true;
}


function validatePassword() {

    if (password.value.length < 8) {

        showError(password, "passwordError");

        return false;
    }

    showSuccess(password, "passwordError");

    return true;
}


function validateEmail() {

    const emailRegex =
        /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!emailRegex.test(email.value.trim())) {

        showError(email, "emailError");

        return false;
    }

    showSuccess(email, "emailError");

    return true;
}


function validatePhoneNumber() {

    const phoneRegex = /^[0-9]{11}$/;

    if (!phoneRegex.test(phoneNumber.value.trim())) {

        showError(phoneNumber, "phoneError");

        return false;
    }

    showSuccess(phoneNumber, "phoneError");

    return true;
}


userName.addEventListener("input", validateUserName);

password.addEventListener("input", validatePassword);

email.addEventListener("input", validateEmail);

phoneNumber.addEventListener("input", validatePhoneNumber);


showPassword.addEventListener("click", function() {

    if (password.type === "password") {

        password.type = "text";

        showPassword.textContent = "Hide";

    } else {

        password.type = "password";

        showPassword.textContent = "Show";
    }

});


form.addEventListener("submit", function(event) {

    const isUserNameValid = validateUserName();

    const isPasswordValid = validatePassword();

    const isEmailValid = validateEmail();

    const isPhoneValid = validatePhoneNumber();


    if (
        !isUserNameValid ||
        !isPasswordValid ||
        !isEmailValid ||
        !isPhoneValid
    ) {

        event.preventDefault();

        return;
    }


    submitButton.disabled = true;

    submitButton.textContent = "Creating Account...";

});

</script>

</body>

</html>

