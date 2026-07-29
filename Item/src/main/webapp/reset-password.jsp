```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Reset Password</title>

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

.password-box {
    position: relative;
}

.password-box input {
    width: 100%;
    padding: 14px 65px 14px 15px;
    border: 1px solid #cbd5e1;
    border-radius: 12px;
    outline: none;
    font-size: 15px;
    background: #f8fafc;
    transition: 0.3s;
}

.password-box input:focus {
    border-color: #2563eb;
    background: white;
    box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.12);
}

.password-box input.invalid {
    border-color: #ef4444;
    box-shadow: 0 0 0 4px rgba(239, 68, 68, 0.1);
}

.password-box input.valid {
    border-color: #22c55e;
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

.reset-button {
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

.reset-button:hover {
    transform: translateY(-2px);
    box-shadow: 0 12px 25px rgba(37, 99, 235, 0.35);
}

.reset-button:active {
    transform: scale(0.98);
}

.reset-button:disabled {
    opacity: 0.7;
    cursor: not-allowed;
}

.back {
    text-align: center;
    margin-top: 25px;
}

.back a {
    color: #2563eb;
    text-decoration: none;
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

    <h2>Reset Password</h2>

    <p class="info">
        Create a new secure password for your account.
    </p>


    <form
        id="resetPasswordForm"
        action="/item-serves-1/UserController"
        method="post"
        novalidate>

        <input
            type="hidden"   name="action"    value="resetPassword">
           
          


        <div class="input-group">

            <label>New Password</label>

            <div class="password-box">

                <input
                    type="password"
                    id="newPassword"
                    name="newPassword"
                    placeholder="Enter new password">

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
            class="reset-button"
            id="resetButton">

            Reset Password

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

const resetPasswordForm =
    document.getElementById("resetPasswordForm");

const newPassword =
    document.getElementById("newPassword");

const passwordError =
    document.getElementById("passwordError");

const showPassword =
    document.getElementById("showPassword");

const resetButton =
    document.getElementById("resetButton");


function validatePassword() {

    if (newPassword.value.length < 8) {

        newPassword.classList.remove("valid");

        newPassword.classList.add("invalid");

        passwordError.style.display = "block";

        return false;
    }


    newPassword.classList.remove("invalid");

    newPassword.classList.add("valid");

    passwordError.style.display = "none";

    return true;
}


newPassword.addEventListener(
    "input",
    validatePassword
);


showPassword.addEventListener(
    "click",
    function() {

        if (newPassword.type === "password") {

            newPassword.type = "text";

            showPassword.textContent = "Hide";

        } else {

            newPassword.type = "password";

            showPassword.textContent = "Show";
        }
    }
);


resetPasswordForm.addEventListener(
    "submit",
    function(event) {

        const isPasswordValid =
            validatePassword();


        if (!isPasswordValid) {

            event.preventDefault();

            return;
        }


        resetButton.disabled = true;

        resetButton.textContent =
            "Resetting Password...";
    }
);

</script>

</body>

</html>

