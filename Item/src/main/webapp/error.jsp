```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Error</title>

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
    max-width: 500px;
    padding: 50px 40px;
    background: rgba(255, 255, 255, 0.97);
    border-radius: 24px;
    text-align: center;
    box-shadow: 0 25px 60px rgba(0, 0, 0, 0.35);
    animation: showCard 0.7s ease;
}

.error-icon {
    width: 70px;
    height: 70px;
    margin: 0 auto 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 20px;
    background: #fee2e2;
    color: #ef4444;
    font-size: 35px;
    font-weight: bold;
    animation: shake 0.6s ease;
}

h1 {
    font-size: 65px;
    line-height: 1;
    background: linear-gradient(135deg, #2563eb, #06b6d4);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    margin-bottom: 15px;
}

h2 {
    color: #0f172a;
    font-size: 25px;
    margin-bottom: 12px;
}

p {
    color: #64748b;
    font-size: 15px;
    line-height: 1.7;
    margin-bottom: 30px;
}

.back-button {
    display: inline-block;
    width: 100%;
    padding: 14px;
    border: none;
    border-radius: 12px;
    text-decoration: none;
    background: linear-gradient(135deg, #2563eb, #06b6d4);
    color: white;
    font-size: 16px;
    font-weight: 700;
    cursor: pointer;
    transition: 0.3s;
}

.back-button:hover {
    transform: translateY(-2px);
    box-shadow: 0 12px 25px rgba(37, 99, 235, 0.35);
}

.back-button:active {
    transform: scale(0.98);
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

@keyframes shake {

    0%, 100% {
        transform: translateX(0);
    }

    25% {
        transform: translateX(-8px);
    }

    50% {
        transform: translateX(8px);
    }

    75% {
        transform: translateX(-4px);
    }
}

@media(max-width: 500px) {

    .container {
        padding: 40px 25px;
    }

    h1 {
        font-size: 55px;
    }
}

</style>

</head>

<body>

<div class="container">

    <div class="error-icon">
        !
    </div>

    <h1>Error</h1>

    <h2>
        Oops! Something went wrong
    </h2>

    <p>
        The information you entered may be incorrect.
        <br>
        Please try again.
    </p>

    <a
        href="/item-serves-1/login.jsp"
        class="back-button"
        id="backButton">

        Back To Login

    </a>

</div>

<script>

const backButton =
    document.getElementById("backButton");

backButton.addEventListener(
    "click",
    function() {

        backButton.textContent =
            "Redirecting...";

    }
);

</script>

</body>

</html>
```
