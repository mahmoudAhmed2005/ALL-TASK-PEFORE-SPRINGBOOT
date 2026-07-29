```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Login</title>

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

.login-container {
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

.login-container h2 {
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
    font-weight: 600;
    text-align: center;
}

.login-button {
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

.login-button:hover {
    transform: translateY(-2px);
    box-shadow: 0 12px 25px rgba(37, 99, 235, 0.35);
}

.login-button:active {
    transform: scale(0.98);
}

.login-button:disabled {
    opacity: 0.7;
    cursor: not-allowed;
}

.links {
    margin-top: 25px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 14px;
}

.links a {
    color: #2563eb;
    text-decoration: none;
    font-weight: 700;
}

.links a:hover {
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

    .login-container {
        padding: 30px 22px;
    }

    .login-container h2 {
        font-size: 26px;
    }

    .links {
        flex-direction: column;
        gap: 15px;
    }
}

</style>

</head>

<body>

<%

String savedUserName = "";

Cookie[] cookies = request.getCookies();

if (cookies != null) {

    for (Cookie cookie : cookies) {

        if ("userName".equals(cookie.getName())) {

            savedUserName = cookie.getValue();

            break;
        }
    }
}

%>


<div class="login-container">

    <div class="logo">W</div>

    <h2>Welcome Back</h2>

    <p class="subtitle">
        Login to your eWallet account
    </p>


    <% if (request.getAttribute("error") != null) { %>

        <div class="server-error">

            <%= request.getAttribute("error") %>

        </div>

    <% } %>


    <form
        id="loginForm"
        action="/item-serves-1/UserController"
        method="post"
        novalidate>

        <input
            type="hidden"   name="action"   value="logIn">
           
           


        <div class="input-group">

            <label>Username</label>

            <input
                type="text"
                id="userName"
                name="userName"
                value="<%= savedUserName %>"
                placeholder="Enter your username">

            <p
                class="error-message"
                id="userNameError">

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


            <p
                class="error-message"
                id="passwordError">

                Password must be at least 8 characters

            </p>

        </div>


        <button
            type="submit"
            class="login-button"
            id="loginButton">

            Login

        </button>

    </form>


    <div class="links">

        <a href="/item-serves-1/check-email.jsp">
            Forgot Password?
        </a>

        <a href="/item-serves-1/signup.jsp">
            Create Account
        </a>

    </div>

</div>


<script>

const loginForm =
    document.getElementById("loginForm");

const userName =
    document.getElementById("userName");

const password =
    document.getElementById("password");

const showPassword =
    document.getElementById("showPassword");

const loginButton =
    document.getElementById("loginButton");


function showError(input, errorId) {

    input.classList.remove("valid");

    input.classList.add("invalid");

    document.getElementById(errorId)
        .style.display = "block";
}


function showSuccess(input, errorId) {

    input.classList.remove("invalid");

    input.classList.add("valid");

    document.getElementById(errorId)
        .style.display = "none";
}


function validateUserName() {

    if (userName.value.trim().length < 3) {

        showError(
            userName,
            "userNameError"
        );

        return false;
    }


    showSuccess(
        userName,
        "userNameError"
    );

    return true;
}


function validatePassword() {

    if (password.value.length < 8) {

        showError(
            password,
            "passwordError"
        );

        return false;
    }


    showSuccess(
        password,
        "passwordError"
    );

    return true;
}


userName.addEventListener(
    "input",
    validateUserName
);


password.addEventListener(
    "input",
    validatePassword
);


showPassword.addEventListener(
    "click",
    function() {

        if (password.type === "password") {

            password.type = "text";

            showPassword.textContent = "Hide";

        } else {

            password.type = "password";

            showPassword.textContent = "Show";
        }
    }
);


loginForm.addEventListener(
    "submit",
    function(event) {

        const isUserNameValid =
            validateUserName();

        const isPasswordValid =
            validatePassword();


        if (
            !isUserNameValid ||
            !isPasswordValid
        ) {

            event.preventDefault();

            return;
        }


        loginButton.disabled = true;

        loginButton.textContent =
            "Logging in...";
    }
);

</script>

</body>

</html>

