let result5 = {};
let allCourses5 = {};

function filterCourses5() {
  var filter = document.getElementById("inputFilter5").value;
  result5.courses = allCourses5.courses.filter(x => x.code.toUpperCase().includes(filter.toUpperCase()) + x.title.toUpperCase().includes(filter.toUpperCase()))
  let select = document.getElementById("five");
  
  while (select.firstChild) {
        select.removeChild(select.firstChild);
  }
  
  for (let i = 0; i < result5.courses.length; i++){
        let option = document.createElement("option");
        option.value = result5.courses[i]._id;
        option.text = result5.courses[i].code +" "+ " : " + result5.courses[i].title + " "+" - " + result5.courses[i].type;
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
    allCourses5 = await getCourses();
    result5 = Object.assign({}, allCourses5);
    let select = document.getElementById("five");
    for (let i = 0; i < result5.courses.length; i++){
        let option = document.createElement("option");
        option.value = result5.courses[i]._id;
        option.text = result5.courses[i].code +" "+ " : " + result5.courses[i].title + " "+" - " + result5.courses[i].type;
        select.appendChild(option);
    }
}

renderCourses()