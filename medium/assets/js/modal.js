let modalDiv = document.querySelector("#modal");
let signIn = document.querySelector("#signin-btn")
let close = document.querySelector("#close-modal");

signIn.addEventListener("click", () => {
    modalDiv.className = modalDiv.className.replace('invisible', 'visible');
});
close.addEventListener("click", () => {
    modalDiv.className = modalDiv.className.replace('visible', 'invisible');
});


