const slidePage = document.querySelector(".slidepage");
const nextBtnFirst = document.querySelector(".nextBtn");
const prevBtnSec = document.querySelector(".prevtBtn-2");
const nextBtnSec = document.querySelector(".nextBtn-2");
const prevBtnThird = document.querySelector(".prevtBtn-3");
const nextBtnThird = document.querySelector(".nextBtn-3");
const prevBtnFourth = document.querySelector(".prevtBtn-4");
const submitBtn = document.querySelector(".submit");
const progressText = document.querySelectorAll(".step p");
const progressCheck = document.querySelectorAll(".step .check");
const bullet = document.querySelectorAll(".step .bullet");
let current = 1;

nextBtnFirst.addEventListener("click", function(){
  slidePage.style.marginLeft = "-25%";
  bullet[current - 1].classList.add("active");
  progressText[current - 1].classList.add("active");
  progressCheck[current - 1].classList.add("active");
  current += 1;
});
nextBtnSec.addEventListener("click", function(){
  slidePage.style.marginLeft = "-50%";
  bullet[current - 1].classList.add("active");
  progressText[current - 1].classList.add("active");
  progressCheck[current - 1].classList.add("active");
  current += 1;
});
nextBtnThird.addEventListener("click", function(){  
  slidePage.style.marginLeft = "-75%";
  bullet[current - 1].classList.add("active");
  progressText[current - 1].classList.add("active");
  progressCheck[current - 1].classList.add("active");
  current += 1;
});


prevBtnSec.addEventListener("click", function(){
  slidePage.style.marginLeft = "0%";
  bullet[current - 2].classList.remove("active");
  progressText[current - 2].classList.remove("active");
  progressCheck[current - 2].classList.remove("active");
  current -= 1;
});
prevBtnThird.addEventListener("click", function(){
  slidePage.style.marginLeft = "-25%";
  bullet[current - 2].classList.remove("active");
  progressText[current - 2].classList.remove("active");
  progressCheck[current - 2].classList.remove("active");
  current -= 1;
});
prevBtnFourth.addEventListener("click", function(){
  slidePage.style.marginLeft = "-50%";
  bullet[current - 2].classList.remove("active");
  progressText[current - 2].classList.remove("active");
  progressCheck[current - 2].classList.remove("active");
  current -= 1;
});

