document.addEventListener('DOMContentLoaded', function() {
  const todoForm = document.getElementById('todo-form');
  const todoInput = document.getElementById('todo-input');
  const todoList = document.getElementById('todo-list');

  todoForm.addEventListener('submit', function(event) {
    event.preventDefault();

    if (todoInput.value === '') return;

    const newItem = document.createElement('li');
    newItem.classList.add('todo-item');

    const checkbox = document.createElement('input');
    checkbox.type = 'checkbox';
    checkbox.addEventListener('change', function(event) {
      const parent = event.target.parentNode;
      if (event.target.checked) {
        parent.style.textDecoration = 'line-through';
      } else {
        parent.style.textDecoration = 'none';
      }
    });

    const task = document.createElement('span');
    task.textContent = todoInput.value;

    const deleteButton = document.createElement('button');
    deleteButton.textContent = '削除';
    deleteButton.classList.add('delete-button');
    deleteButton.addEventListener('click', function(event) {
      todoList.removeChild(event.target.parentNode);
    });

    newItem.appendChild(checkbox);
    newItem.appendChild(task);
    newItem.appendChild(deleteButton);
    todoList.appendChild(newItem);

    todoInput.value = '';
  });
});