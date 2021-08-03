let result3 = {};
let allCourses3 = {};

function filterCourses3() {
  var filter = document.getElementById("inputFilter3").value;
  result3.courses = allCourses3.courses.filter(x => x.title.toUpperCase().includes(filter.toUpperCase()))
  let select = document.getElementById("three");
  
  while (select.firstChild) {
        select.removeChild(select.firstChild);
  }
  
  for (let i = 0; i < result3.courses.length; i++){
        let option = document.createElement("option");
        option.value = result3.courses[i]._id;
        option.text = result3.courses[i].title;
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
    allCourses3 = await getCourses();
    result3 = Object.assign({}, allCourses3);
    let select = document.getElementById("three");
    for (let i = 0; i < result3.courses.length; i++){
        let option = document.createElement("option");
        option.value = result3.courses[i]._id;
        option.text = result3.courses[i].title;
        select.appendChild(option);
    }
}

renderCourses()