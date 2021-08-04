let result7 = {};
let allCourses7 = {};

function filterCourses7() {
  var filter = document.getElementById("inputFilter7").value;
  result7.courses = allCourses7.courses.filter(x => x.code.toUpperCase().includes(filter.toUpperCase()) + x.title.toUpperCase().includes(filter.toUpperCase()))
  let select = document.getElementById("seven");
  
  while (select.firstChild) {
        select.removeChild(select.firstChild);
  }
  
  for (let i = 0; i < result7.courses.length; i++){
        let option = document.createElement("option");
        option.value = result7.courses[i]._id;
        option.text = result7.courses[i].code +" "+ " : " + result7.courses[i].title + " "+" - " + result7.courses[i].type;
        select.appendChild(option);
    }
}

async function getCourses() {
    let url = 'users.json';
    try {
        let res = await fetch("https://ffcc-app.herokuapp.com/get/courses");
        return await res.json();
    } catch (error) {
        console.log(error);
    }
}

async function renderCourses() {
    allCourses7 = await getCourses();
    result7 = Object.assign({}, allCourses7);
    let select = document.getElementById("seven");
    for (let i = 0; i < result7.courses.length; i++){
        let option = document.createElement("option");
        option.value = result7.courses[i]._id;
        option.text = result7.courses[i].code +" "+ " : " + result7.courses[i].title + " "+" - " + result7.courses[i].type;
        select.appendChild(option);
    }
}

renderCourses()