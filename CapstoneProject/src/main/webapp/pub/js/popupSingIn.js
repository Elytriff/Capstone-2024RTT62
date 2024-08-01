document.getElementById('signInTrigger').addEventListener('click', function(event) {
    event.preventDefault(); // Prevent default action (navigating away)
    document.getElementById('popupForm').style.display = 'block'; // Show the popup form

});

document.getElementById('signInForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    // Simple validation: check if fields are not empty
    if (username === '' || password === '') {
        document.getElementById('errorMessages').innerText = 'Username and password are required.';
        return; // Stop execution if validation fails
    }

    // Simulate successful sign-in process
    document.getElementById('popupForm').style.display = 'none'; // Hide the form

    // Optionally, perform AJAX request here to submit username and password to the server
});