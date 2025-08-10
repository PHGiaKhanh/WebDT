const signbtn = document.querySelector('#sign-form')
const close = document.querySelector('#dong-sign')
signbtn.addEventListener("click", function () {
    document.querySelector('.sign-form').style.display = "flex"
})
close.addEventListener("click", function () {
    document.querySelector('.sign-form').style.display = "none"
})

var form1 = document.getElementById("Form1")
var form2 = document.getElementById("Form2")
var form3 = document.getElementById("Form3")

var next1 = document.getElementById("Next1");
var next2 = document.getElementById("Next2");


Next1.onclick = function () {
    form1.style.left = "-450px";
    form2.style.left = "0"
}
Next2.onclick = function () {
    form2.style.left = "-450px";
    form3.style.left = "0"
}