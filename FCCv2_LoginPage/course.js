let result = {};
let allCourses = {};

function filterCourses() {
  var filter = document.getElementById("inputFilter").value;
  result.courses = allCourses.courses.filter(x => x.code.toUpperCase().includes(filter.toUpperCase()) + x.title.toUpperCase().includes(filter.toUpperCase()))
  let select = document.getElementById("one");
  
  while (select.firstChild) {
        select.removeChild(select.firstChild);
  }
  
  for (let i = 0; i < result.courses.length; i++){
        let option = document.createElement("option");
        option.value = result.courses[i]._id;
        option.text = result.courses[i].code +" "+ " : " + result.courses[i].title + " "+" - " + result.courses[i].type;
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
    allCourses = await getCourses();
    result = Object.assign({}, allCourses);
    let select = document.getElementById("one");
    for (let i = 0; i < result.courses.length; i++){
        let option = document.createElement("option");
        option.value = result.courses[i]._id;
        option.text = result.courses[i].code +" "+ " : " + result.courses[i].title + " "+" - " + result.courses[i].type;
        select.appendChild(option);
    }
}

renderCourses()

