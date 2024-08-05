// --------------------------- Validation function----------------------------

function onSubmitRegistration() {

    let submited = true;

    let firstName = document.getElementById("firstName");
    let lastName = document.getElementById("lastName");
    let country = document.getElementById("country");
    let email = document.getElementById("email");
    let password = document.getElementById("password");
    let repeatpassword = document.getElementById("repeatPassword");

    // getting the value that the user typed into the input field

    let firstNameValue = firstName.value;
    let lastNameValue = lastName.value;
    let countryValue = country.value;
    let emailValue = email.value;
    let passwordValue = password.value;
    let repeatpasswordValue = repeatpassword.value;

    if (firstNameValue == '') {  //-------------------------------Firstname validation------------------------------
        console.log("Invalid input");

        // appply the boostrap is-invalid class to this input field so it looks red
        firstName.classList.add("is-invalid");

        // subheading fields
        document.getElementById("firstNameHelp").textContent = "First name is required";
        document.getElementById("firstNameHelp").classList.add("invalid-feedback");

        submited = false;
    } else {
        firstName.classList.add("is-valid");
        console.log("First name looks good");
    }

    if (lastNameValue == '') { //-------------------------Lastname validation------------------------------
        console.log("Invalid input");
        lastName.classList.add("is-invalid");
        document.getElementById("lastNameHelp").textContent = "Lastname is required";
        document.getElementById("lastNameHelp").classList.add("invalid-feedback");
        submited = false;
    } else {
        lastName.classList.add("is-valid");
        console.log("Lastname looks good");
    }

    if (countryValue == '') {  // --------------------------------Country validation ---------------------------------------
        console.log("Invalid input");
        country.classList.add("is-invalid");
        document.getElementById("country").textContent = "Country is required";
        document.getElementById("countryHelp").classList.add("invalid-feedback");
        submited = false;
    } else {
        country.classList.add("is-valid");
        // console.log("Country looks good");
    }

    if (emailValue == '') {  //--------------------------------Email validation --------------------------------------
        console.log("Invalid input");
        email.classList.add("is-invalid");
        document.getElementById("email").textContent = "Email is required";
        document.getElementById("emailHelp").classList.add("invalid-feedback");
        submited = false;
    } else {
        email.classList.add("is-valid");
        console.log("Email looks good");
    }

    if (passwordValue == '') {   //------------------------------Password validation -------------------------------------
        console.log("Invalid input");
        password.classList.add("is-invalid");
        document.getElementById("password").textContent = "Password is required";
        document.getElementById("passwordHelp").classList.add("invalid-feedback");
        submited = false;
    } else {
        password.classList.add("is-valid");
        console.log("Password looks good");
    }

    if (repeatpasswordValue == '') { //--------------------------- Repeat password validation ----------------------------
        console.log("Invalid input");
        repeatpassword.classList.add("is-invalid");
        document.getElementById("repeatPassword").textContent = "Please type your password again";
        document.getElementById("repeatPasswordHelp").classList.add("invalid-feedback");
        submited = false;
    } else {
        repeatpassword.classList.add("valid");

    }

    if (passwordValue != repeatpasswordValue) { //-------------------- Password match Validation -----------------------------------
        console.log("Password's inputs are different");
        repeatpassword.classList.add("is-invalid");
        document.getElementById("repeatPassword").textContent = "Password must match";
        document.getElementById("repeatPasswordHelp").classList.add("invalid-feedback");
        submited = false;
    } else {
        repeatpassword.classList.add("is-valid")
    }

};