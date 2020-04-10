var createAccountButton = document.getElementById("createAccount")

function sendEmail() {
    Email.send({
    Host : "smtp.elasticemail.com",
    Username : "team10termproject@gmail.com",
    Password : "9CB0A7F682FC3AC3EFB225D92275BF38DE45",
    To : "trey.hull3@gmail.com",
    From : "team10termproject@gmail.com",
    Subject : "Welcome",
    Body : "Thank you for signing up for the book store. Please validate your email here! http://127.0.0.1:49362/csci4050/html/verificationComplete.html"
    }).then(
        createAccountButton.submit()
    );
}