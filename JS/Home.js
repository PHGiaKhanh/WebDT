const rightbtn = document.querySelector('.fa-circle-arrow-right')
const lefttbtn = document.querySelector('.fa-circle-arrow-left')
console.log(rightbtn);
const imgNumber = document.querySelectorAll('.slider-content-left-top img')
let index = 0;

rightbtn.addEventListener("click", function () {
    index = index + 1;
    if (index > imgNumber.length - 1) {
        index = 0;
    }
    document.querySelector(".slider-content-left-top").style.right = index * 100 + "%"
})
lefttbtn.addEventListener("click", function () {
    index = index - 1;
    if (index <= 0) {
        index = imgNumber.length - 1;
    }
    document.querySelector(".slider-content-left-top").style.right = index * 100 + "%"
})
/*............slider............. */
const imgNumLi = document.querySelectorAll('.slider-content-left-bottom li')


imgNumLi.forEach(function (image, index) {
    image.addEventListener("click", function () {
        removeactive()
        document.querySelector(".slider-content-left-top").style.right = index * 100 + "%"
        image.classList.add("active");

    })
})
function removeactive() {
    let imgactive = document.querySelector('.active')
    imgactive.classList.remove("active")
}
/*..........slider2 ..............*/
function imgauto() {
    index = index + 1
    if (index > imgNumber.length - 1) {
        index = 0;
    }
    removeactive()
    document.querySelector(".slider-content-left-top").style.right = index * 100 + "%"
    imgNumLi[index].classList.add("active")


}
setInterval(imgauto, 5000);
//............slide-product.......
const rightbtk = document.querySelector('.fa-circle-arrow-right-k')
const lefttbtk = document.querySelector('.fa-circle-arrow-left-k')
const imgNumberk = document.querySelectorAll('.slider-product-one-content-items')
//console.log(rightbtk)
//console.log(lefttbtk)
rightbtk.addEventListener("click", function () {
    index = index + 1;
    if (index > imgNumberk.length - 1) {
        index = 0;
    }
    document.querySelector(".slider-product-one-content-items-content").style.right = index * 100 + "%"
})
lefttbtk.addEventListener("click", function () {
    index = index - 1;
    if (index <= 0) {
        index = imgNumberk.length - 1;
    }
    document.querySelector(".slider-product-one-content-items-content").style.right = index * 100 + "%"
})
const rightbtm = document.querySelector('.slider-product-one-content-item')

/*...............................................................................;
....................................................... */


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
