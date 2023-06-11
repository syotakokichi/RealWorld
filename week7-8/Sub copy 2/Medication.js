document.addEventListener("DOMContentLoaded", function() {
  let menuItems = document.querySelectorAll('.menu li');

  menuItems.forEach((item, index) => {
    item.addEventListener('click', function() {
      console.log(`Menu item ${index + 1} clicked.`);
    });
  });
});


document.addEventListener("DOMContentLoaded", function() {
  let buttons = document.querySelectorAll('button');

  buttons.forEach((button) => {
    button.addEventListener('mousedown', function() {
      button.style.opacity = "0.7";
    });
    button.addEventListener('mouseup', function() {
      button.style.opacity = "1";
    });
    button.addEventListener('mouseout', function() {
      button.style.opacity = "1";
    });
  });
});
