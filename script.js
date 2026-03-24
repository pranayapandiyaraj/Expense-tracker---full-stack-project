// script.js - Fulfilling Exercise 3 JavaScript requirements

// 1. Alert box for welcome message
window.onload = function() {
    // Only show on the index page
    if (window.location.pathname.endsWith('index.html') || window.location.pathname === '/') {
        // Ex 3.1: Alert
        alert("Welcome to Smart Expense Tracker!");
        
        // Ex 3.3: Use Date Object
        const today = new Date();
        const dateStr = today.toDateString();
        console.log("Current Date: " + dateStr);

        // Ex 3.1: Confirm & Prompt
        const isReady = confirm("Are you ready to manage your finances?");
        if (isReady) {
            let name = prompt("What's your name?");
            if (name) {
                console.log("Welcome " + name);
            }
        }
    }
};

// Ex 3.4 & 3.5: Form validations and login check
function validateLogin(event) {
    event.preventDefault(); // Prevent form submission
    
    // Get fields
    const username = document.getElementById('username').value;
    const pass = document.getElementById('password').value;
    const phone = document.getElementById('phone').value;
    const email = document.getElementById('email').value;

    // Email validation using regex
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        alert("Invalid Email Address format.");
        return false;
    }

    // Phone number validation (10 digits)
    const phoneRegex = /^\d{10}$/;
    if (!phoneRegex.test(phone)) {
        alert("Invalid Phone Number. Must be exactly 10 digits.");
        return false;
    }

    // Password verification (min 6 chars)
    if (pass.length < 6) {
        alert("Password must be at least 6 characters.");
        return false;
    }

    // Ex 3.5: User name & password logical check
    // Ex 3.2: If condition and perform response
    if (username === "admin" && pass === "admin123") {
        alert("Authorized User! Proceeding to Dashboard.");
        window.location.href = "index.html"; // Redirect
    } else if (username !== "admin") {
        alert("Invalid User Name.");
    } else {
        alert("Invalid Password.");
    }
    
    return false;
}
