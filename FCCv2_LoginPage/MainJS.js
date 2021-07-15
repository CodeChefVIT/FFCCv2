//Slide on Scroll JS
const sliderImages = document.querySelectorAll(".slide-in");
//Debounce function
function debounce(func, wait = 20, immediate = true) {
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

// //Redirect to Login Page
// const redirect = document.getElementById("loginredirect");
// redirect.addEventListener("click",()=>{
//     location.href = './login.html';
// });