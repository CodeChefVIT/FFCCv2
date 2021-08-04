const sign_in_btn = document.querySelector("#sign-in-btn");
const sign_up_btn = document.querySelector("#sign-up-btn");
const container = document.querySelector(".container");

sign_up_btn.addEventListener("click", ()=>{
    container.classList.add("sign-up-mode")
});
sign_in_btn.addEventListener("click", () => {
    container.classList.remove("sign-up-mode");
});

/*Login*/
const form = {
    email: document.querySelector("#signin-email"),
    password: document.querySelector("#signin-password"),
    submit: document.querySelector("#signin-btn-submit"),
    messages:document.getElementById("form-messages")
};
let button = form.submit.addEventListener("click", (e)=> {
    e.preventDefault();
    const login = 'https://ffcc-app.herokuapp.com/user/login';
    
    fetch(login, {
      method: "POST",
      headers: {
        Accept: "application/json, text/plain, */*",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        email: form.email.value,
        password: form.password.value,
      }),
    })
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
        // code here //
        if (data.error) {
          while(form.messages.firstChild)
          {
            form.messages.removeChild(form.messages.firstChild);
          }
          const li = document.createElement('li');
          li.textContent = data.message;
          form.messages.appendChild(li);

          form.messages.style.display = 'block';    /*displays incorrect password*/
        } 
        else if(data.message=='Login succesfull')
        {
          window.open(
            "index.html"
          ); /*opens the target page while Id & password matches*/
        }
        else if(data.message=='User does not exist')
        {
          while(form.messages.firstChild)
          {
            form.messages.removeChild(form.messages.firstChild);  //Removes any previous message
          }
          const li = document.createElement('li');
          li.textContent = data.message;
          form.messages.appendChild(li);

          form.messages.style.display = 'block';    /*displays user doesnt exist*/ 
        } 
      })
      .catch((err) => {
        console.log(err);
      });
});
    
/*Sign-up*/
const form1 = {
    email: document.querySelector("#signup-email"),
    password: document.querySelector("#signup-password"),
    submit: document.querySelector("#signup-btn-submit"),
    messages:document.getElementById("form-messages1")
};
let button1 = form1.submit.addEventListener("click",(e)=>{
    e.preventDefault();
    const signup = 'https://ffcc-app.herokuapp.com/user/signup';

    fetch(signup, {
      method: "POST",
      headers: {
        Accept: "application/json, text/plain, */*",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        email: form1.email.value,
        password: form1.password.value,
      }),
    })
      .then((response)=> response.json())
      .then((data) => {
        console.log(data);
        //code here//
        if(data.message=='Account created succesfully')
        {
          window.open(
            "login.html"
          ); 
        }
        else if(data.message=='User already exists')
        {
          while(form1.messages.firstChild)
          {
            form1.messages.removeChild(form1.messages.firstChild);  //Removes any previous message
          }
          const li = document.createElement('li');
          li.textContent = data.message;
          form1.messages.appendChild(li);

          form1.messages.style.display = 'block';    /*displays user already exists*/ 
        }
      })
})
