let currentNumber = "";
let storedNumber = "";
let operator = null;

const display = document.getElementById('display');
const buttons = Array.from(document.getElementsByClassName('digit'));
const operators = Array.from(document.getElementsByClassName('operator'));
const clear = document.getElementById('clear');
const equals = document.getElementById('equals');

function updateDisplay() {
  display.textContent = currentNumber;
}

buttons.forEach(button => {
  button.addEventListener('click', () => {
    currentNumber += button.textContent;
    updateDisplay();
  });
});

operators.forEach(op => {
  op.addEventListener('click', () => {
    if (currentNumber === "") return;
    if (storedNumber !== "") calculate();
    operator = op.textContent;
    storedNumber = currentNumber;
    currentNumber = "";
  });
});

equals.addEventListener('click', () => {
  if (currentNumber === "" || operator === null) return;
  calculate();
  operator = null;
});

clear.addEventListener('click', () => {
  currentNumber = "";
  storedNumber = "";
  operator = null;
  updateDisplay();
});

function calculate() {
  let result;
  const num1 = parseFloat(storedNumber);
  const num2 = parseFloat(currentNumber);

  switch (operator) {
    case "+":
      result = num1 + num2;
      break;
    case "-":
      result = num1 - num2;
      break;
    case "*":
      result = num1 * num2;
      break;
    case "/":
      if (num2 === 0) {
        alert("0で除算することはできません");
        return;
      }
      result = num1 / num2;
      break;
    default:
      return;
  }

  currentNumber = result.toString();
  storedNumber = "";
  updateDisplay();
}