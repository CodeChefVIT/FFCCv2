let result2 = {};
let allCourses2 = {};

function filterCourses2() {
  var filter = document.getElementById("inputFilter2").value;
  result2.courses = allCourses2.courses.filter(x => x.code.toUpperCase().includes(filter.toUpperCase()) + x.title.toUpperCase().includes(filter.toUpperCase()))
  let select = document.getElementById("two");
  
  while (select.firstChild) {
        select.removeChild(select.firstChild);
  }
  
  for (let i = 0; i < result2.courses.length; i++){
        let option = document.createElement("option");
        option.value = result2.courses[i]._id;
        option.text = result2.courses[i].code +" "+ " : " + result2.courses[i].title + " "+" - " + result2.courses[i].type;
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
    allCourses2 = await getCourses();
    result2 = Object.assign({}, allCourses2);
    let select = document.getElementById("two");
    for (let i = 0; i < result2.courses.length; i++){
        let option = document.createElement("option");
        option.value = result2.courses[i]._id;
        option.text = result2.courses[i].code +" "+ " : " + result2.courses[i].title + " "+" - " + result2.courses[i].type;
        select.appendChild(option);
    }
}

renderCourses()