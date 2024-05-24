/**script
 * 
 */
const form = document.getElementById("form");
const username = document.getElementById("username");
const password = document.getElementById("password");
String.prototype.isAlpha = function () {
  return !!this.match(/^[a-zA-Z]*$/);
};

function checkRequired(inputs) {
  inputs.forEach((input) => {
    if (input.value.trim() === "") {
      errorInput(input, `${getName(input)} is Required`);
    } else {
      successInput(input);
    }
  });
}
function getName(input) {
  return input.id;
}
function errorInput(input, message) {
  const one = input.parentElement;
  one.className = "one error";
  const p = one.querySelector("p");
  p.innerHTML = message;
}
function successInput(input) {
  const one = input.parentElement;
  one.one = "one success";
  const p = one.querySelector("p");
  p.innerHTML = "";
}

function checkLength(input, min, max) {
  const data = input.value.trim().length;
  if (data < min) {
    errorInput(input, `${getName(input)} must be aleast greater than ${min} characters`);
  } else if (data > max) {
    errorInput(input, `${getName(input)} must be aleast lesser than ${max} characters`);
  } else {
    successInput(input);
  }
}

function checkAlpha(input) {
  if (!input.value.trim().isAlpha()) {
    errorInput(input, `${getName(input)}  Must be Alphabets`);
  }
}

form.addEventListener("submit", function (e) {
  e.preventDefault();
  checkRequired([username, password]);
  checkLength(username, 5, 10);
  checkLength(password, 5, 10);
  checkAlpha(username);
});
