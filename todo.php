<!DOCTYPE html>
<html>
<head>
    <title>To-Do List App</title>
    <style>
        /* Add some basic CSS styling for the To-Do list */
        body {
            font-family: Arial, sans-serif;
        }
        #todoList {
            list-style: none;
            padding: 0;
        }
        li {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h1>To-Do List</h1>
    <form>
        <input type="text" id="taskInput" placeholder="Add new task">
        <button type="button" onclick="addTask()">Add</button>
    </form>
    <ul id="todoList">
        <!-- PHP code to populate the To-Do list with JavaScript -->
        <?php
        $tasks = array("Task 1", "Task 2", "Task 3"); // Sample tasks
        foreach ($tasks as $task) {
            echo "<li>$task</li>";
        }
        ?>
    </ul>

    <script>
        // JavaScript code to handle the To-Do list functionality
        function addTask() {
            var taskInput = document.getElementById("taskInput");
            var task = taskInput.value;
            if (task.trim() !== "") {
                var todoList = document.getElementById("todoList");
                var listItem = document.createElement("li");
                listItem.textContent = task;
                todoList.appendChild(listItem);
                taskInput.value = "";
            }
        }

        document.getElementById('inputField').addEventListener('keydown', function(event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                var taskInput = document.getElementById("taskInput");
                var task = taskInput.value;
                if (task.trim() !== "") {
                    var todoList = document.getElementById("todoList");
                    var listItem = document.createElement("li");
                    listItem.textContent = task;
                    todoList.appendChild(listItem);
                    taskInput.value = "";
                }
            }
        });
    </script>
</body>
</html>
