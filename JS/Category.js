const rightbtn = document.querySelector('.fa-circle-chevron-right')
const leftbtn = document.querySelector('.fa-circle-chevron-left')
const imgnumber = document.querySelectorAll('.slider-content img')

let index = 0


rightbtn.addEventListener("click", function () {
    index = index + 1
    if (index > imgnumber.length - 1) {
        index = 0
    }
    document.querySelector(".slider-content").style.right = index * 100 + "%"
})
leftbtn.addEventListener("click", function () {
    index = index - 1
    if (index < 0) {
        index = imgnumber.length
    }
    document.querySelector(".slider-content").style.right = index * 100 + "%"
})
//---------slider-move---------
function imgAuto() {
    index = index + 1
    if (index > imgnumber.length - 1) {
        index=0
    }
    document.querySelector(".slider-content").style.right = index * 100 + "%"
})
}
setInterval(imgAuto,5000)