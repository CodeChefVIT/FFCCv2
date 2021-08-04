let result6 = {};
let allCourses6 = {};

function filterCourses6() {
  var filter = document.getElementById("inputFilter6").value;
  result6.courses = allCourses.courses.filter(x => x.code.toUpperCase().includes(filter.toUpperCase()) + x.title.toUpperCase().includes(filter.toUpperCase()))
  let select = document.getElementById("six");
  
  while (select.firstChild) {
        select.removeChild(select.firstChild);
  }
  
  for (let i = 0; i < result6.courses.length; i++){
        let option = document.createElement("option");
        option.value = result6.courses[i]._id;
        option.text = result6.courses[i].code +" "+ " : " + result6.courses[i].title + " "+" - " + result6.courses[i].type;
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
    result6 = Object.assign({}, allCourses);
    let select = document.getElementById("six");
    for (let i = 0; i < result6.courses.length; i++){
        let option = document.createElement("option");
        option.value = result6.courses[i]._id;
        option.text = result6.courses[i].code +" "+ " : " + result6.courses[i].title + " "+" - " + result6.courses[i].type;
        select.appendChild(option);
    }
}

renderCourses()