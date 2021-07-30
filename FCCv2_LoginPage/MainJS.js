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

/*GET Courses*/
const endpoint = 'https://ffcc-app.herokuapp.com/get/courses';

let courses =[];

fetch(endpoint)
    .then(response => response.json())
    .then(data => courses=data.courses)

function findMatches(wordToMatch , courses){
    return courses.filter(function place(a){
        const regex = new RegExp(wordToMatch,'gi')
        return a.code.match(regex) || a.title.match(regex)
    });
}

function displayMatches(){
    const matchArray = findMatches(this.value, courses)
    const html = matchArray.map(place => {
        const regex = new RegExp(this.value, 'gi');
        const code = place.code.replace(regex, `<span class="hl">${this.value}</span>`);
        const title = place.title.replace(regex, `<span class="hl">${this.value}</span>`);
        return `
        <li>
            <span class="name">${code} , ${title}</span>
            <span class="credits">${place.credits} , ${place.type}</span>
        </li>
        `
    }).join("");
    suggest1.innerHTML = html;
}

function displayMatches2(){
    const matchArray = findMatches(this.value, courses)
    const html = matchArray.map(place => {
        const regex = new RegExp(this.value, 'gi');
        const code = place.code.replace(regex, `<span class="hl">${this.value}</span>`);
        const title = place.title.replace(regex, `<span class="hl">${this.value}</span>`);
        return `
        <li>
            <span class="name">${code} , ${title}</span>
            <span class="credits">${place.credits}, ${place.type}</span>
        </li>
        `
    }).join("");
    suggest2.innerHTML = html;
    let li = document.getElementById("S2").getElementsByTagName("li");
    console.log(li.length);
}

const searchInput1 = document.getElementById("C1");
const suggest1 = document.getElementById("S1");
searchInput1.addEventListener("change",displayMatches);
searchInput1.addEventListener("keyup",displayMatches);

const searchInput2 = document.getElementById("C2");
const suggest2 = document.getElementById("S2");
searchInput2.addEventListener("change",displayMatches2);
searchInput2.addEventListener("keyup",displayMatches2);

