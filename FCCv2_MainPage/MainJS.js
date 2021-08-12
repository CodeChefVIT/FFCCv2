//Slide on Scroll JS
const sliderImages = document.querySelectorAll(".slide-in");
//Debounce function
function debounce(func, wait = 15, immediate = true) {
    var timeout;
    return function() {
      var context = this, args = arguments;
      var later = function() {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
};
function checkSlide(e){
    sliderImages.forEach(sliderImage =>{
        const slideInAt = (window.scrollY + window.innerHeight);
        const bottom = (sliderImage.offsetTop);
        const isHalfShown = slideInAt > sliderImage.offsetTop;

        if(isHalfShown){
            sliderImage.classList.add('active');
        }
        else{
            sliderImage.classList.remove('active');
        }
    });
}
window.addEventListener("scroll", debounce(checkSlide));

//Scroll To Top
const scrollTop = document.querySelector(".scroll-to-top");

const buttonVisibility = ()=>{
    if(document.documentElement.scrollTop <=950){
        scrollTop.style.display = "none";
    }
    else{
        scrollTop.style.display = "block";
    }
}
buttonVisibility();

scrollTop.addEventListener("click", () =>{
    document.documentElement.scrollTop =0;
    document.body.scrollTop =0;
});

document.addEventListener("scroll",(e)=>{
    buttonVisibility();
});

