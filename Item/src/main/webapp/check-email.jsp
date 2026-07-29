```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Forgot Password</title>

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

.info {
    text-align: center;
    color: #64748b;
    font-size: 14px;
    margin-bottom: 30px;
    line-height: 1.6;
}

.input-group {
    margin-bottom: 20px;
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

.error-message {
    display: none;
    color: #ef4444;
    font-size: 12px;
    margin-top: 7px;
}

.server-error {
    padding: 12px;
    margin-top: 18px;
    border-radius: 10px;
    background: #fee2e2;
    color: #b91c1c;
    font-size: 14px;
    font-weight: 600;
    text-align: center;
}

.continue-button {
    width: 100%;
    padding: 14px;
    border: none;
    border-radius: 12px;
    background: linear-gradient(135deg, #2563eb, #06b6d4);
    color: white;
    font-size: 16px;
    font-weight: 700;
    cursor: pointer;
    transition: 0.3s;
}

.continue-button:hover {
    transform: translateY(-2px);
    box-shadow: 0 12px 25px rgba(37, 99, 235, 0.35);
}

.continue-button:active {
    transform: scale(0.98);
}

.continue-button:disabled {
    opacity: 0.7;
    cursor: not-allowed;
}

.back {
    text-align: center;
    margin-top: 25px;
}

.back a {
    text-decoration: none;
    color: #2563eb;
    font-size: 14px;
    font-weight: 700;
}

.back a:hover {
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

    <h2>Forgot Password?</h2>

    <p class="info">
        Enter the email address associated with your account
        to continue.
    </p>


    <form
        id="emailForm"
        action="/item-serves-1/UserController"
        method="post"
        novalidate>

        <input
            type="hidden" name="action"   value="checkEmail">
            
           


        <div class="input-group">

            <label>Email Address</label>

            <input
                type="email"
                id="email"
                name="email"
                placeholder="example@email.com">

            <p
                class="error-message"
                id="emailError">

                Please enter a valid email address

            </p>

        </div>


        <button
            type="submit"
            class="continue-button"
            id="continueButton">

            Continue

        </button>

    </form>


    <% if (request.getAttribute("error") != null) { %>

        <div class="server-error">

            <%= request.getAttribute("error") %>

        </div>

    <% } %>


    <div class="back">

        <a href="/item-serves-1/login.jsp">
            ← Back to Login
        </a>

    </div>

</div>


<script>

const emailForm =
    document.getElementById("emailForm");

const email =
    document.getElementById("email");

const emailError =
    document.getElementById("emailError");

const continueButton =
    document.getElementById("continueButton");


function validateEmail() {

    const emailRegex =
        /^[^\s@]+@[^\s@]+\.[^\s@]+$/;


    if (!emailRegex.test(email.value.trim())) {

        email.classList.remove("valid");

        email.classList.add("invalid");

        emailError.style.display = "block";

        return false;
    }


    email.classList.remove("invalid");

    email.classList.add("valid");

    emailError.style.display = "none";

    return true;
}


email.addEventListener(
    "input",
    validateEmail
);


emailForm.addEventListener(
    "submit",
    function(event) {

        const isEmailValid =
            validateEmail();


        if (!isEmailValid) {

            event.preventDefault();

            return;
        }


        continueButton.disabled = true;

        continueButton.textContent =
            "Checking Email...";
    }
);

</script>


</body>

</html>

