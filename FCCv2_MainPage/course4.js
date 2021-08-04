let result4 = {};
let allCourses4 = {};

function filterCourses4() {
  var filter = document.getElementById("inputFilter4").value;
  result4.courses = allCourses4.courses.filter(x => x.title.toUpperCase().includes(filter.toUpperCase()))
  let select = document.getElementById("four");
  
  while (select.firstChild) {
        select.removeChild(select.firstChild);
  }
  
  for (let i = 0; i < result4.courses.length; i++){
        let option = document.createElement("option");
        option.value = result4.courses[i]._id;
        option.text = result4.courses[i].title;
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
    allCourses4 = await getCourses();
    result4 = Object.assign({}, allCourses4);
    let select = document.getElementById("four");
    for (let i = 0; i < result4.courses.length; i++){
        let option = document.createElement("option");
        option.value = result4.courses[i]._id;
        option.text = result4.courses[i].title;
        select.appendChild(option);
    }
}

renderCourses()