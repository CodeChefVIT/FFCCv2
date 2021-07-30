/*Fetching Courses*/

// let course_dropdown = document.getElementById("one");

// async function getCourses(){
//   var response = await fetch('https://ffcc-app.herokuapp.com/get/courses');
//   var json_data = await response.json();

//   console.log(json_data);
//   course_dropdown.innerHTML="";

//   Object.keys(json_data).forEach((item,index)=>{
//     var opt = document.createElement("option");
//     opt.text = item.title;
//     opt.value = item.code;

//     course_dropdown.appendChild(opt);
//   });
// }
// getCourses();

const point = 'https://ffcc-app.herokuapp.com/get/courses';

let courses1 =[];

fetch(point)
    .then(response => response.json())
    .then(data => courses1=data.courses)

function findMatches(wordToMatch , courses1){
    return courses1.filter(function place(a){
        const regex = new RegExp(wordToMatch,'gi')
        return a.code.match(regex) || a.title.match(regex)
    });
}

function displayMatches(){
    const matchArray = findMatches(this.value, courses1)
    const html = matchArray.map(place => {
        const regex = new RegExp(this.value, 'gi');
        const code = place.code.replace(regex, `<span class="hl">${this.value}</span>`);
        const title = place.title.replace(regex, `<span class="hl">${this.value}</span>`);
        return `
        <div class="option">
              <input type="radio" class="radio" name="category" />
              <label for="course-1"> ${code} , ${title} , ${place.credits} , ${place.type}</label>
        </div>
        `
    }).join("");
    opt.innerHTML = html;
}
const search = document.querySelector(".search-box");
const opt = document.querySelector(".options-container");
search.addEventListener("change",displayMatches);
search.addEventListener("keyup",displayMatches);

/*Active toggle */

const selectedAll = document.querySelectorAll(".selected");
selectedAll.forEach((selected) => {
    const optionsContainer = selected.previousElementSibling;
    const searchBox = selected.nextElementSibling;
  
    const optionsList = optionsContainer.querySelectorAll(".option");
  
    selected.addEventListener("click", () => {
      if (optionsContainer.classList.contains("active")) {
        optionsContainer.classList.remove("active");
      } else {
        let currentActive = document.querySelector(".options-container.active");
  
        if (currentActive) {
          currentActive.classList.remove("active");
        }
  
        optionsContainer.classList.add("active");
      }
  
      searchBox.value = "";
    //   filterList("");
  
      if (optionsContainer.classList.contains("active")) {
        searchBox.focus();
      }
    });
  
    optionsList.forEach((o) => {
      o.addEventListener("click", () => {
        selected.innerHTML = o.querySelector("label").innerHTML;
        optionsContainer.classList.remove("active");
      });
    });

  
    // searchBox.addEventListener("keyup", function (e) {
    //   filterList(e.target.value);
    // });
  
    // const filterList = (searchTerm) => {
    //   searchTerm = searchTerm.toLowerCase();
    //   optionsList.forEach((option) => {
    //     let label = option.firstElementChild.nextElementSibling.innerText.toLowerCase();
    //     if (label.indexOf(searchTerm) != -1) {
    //       option.style.display = "block";
    //     } else {
    //       option.style.display = "none";
    //     }
    //   });
    // };
});

