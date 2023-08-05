<!DOCTYPE html>
<html>
<head>
    <title>Simple To-Do List</title>
</head>
<body>
    <h1>To-Do List</h1>
    <form method="post" action="index.php">
        <input type="text" name="task" placeholder="Enter task">
        <button type="submit" name="add">Add</button>
    </form>

    <?php
    session_start();
    if (isset($_POST['add'])) {
        $task = $_POST['task'];
        if (!empty($task)) {
            $_SESSION['tasks'][] = $task;
        }
    }

    if (isset($_POST['remove'])) {
        $index = $_POST['index'];
        if (isset($_SESSION['tasks'][$index])) {
            unset($_SESSION['tasks'][$index]);
        }
    }

    if (isset($_SESSION['tasks']) && count($_SESSION['tasks']) > 0) {
        echo "<h2>Tasks:</h2>";
        echo "<ul>";
        foreach ($_SESSION['tasks'] as $index => $task) {
            echo "<li>$task";
            echo "<form method='post' action='index.php'>";
            echo "<input type='hidden' name='index' value='$index'>";
            echo "<button type='submit' name='remove'>Remove</button>";
            echo "</form>";
            echo "</li>";
        }
        echo "</ul>";
    } else {
        echo "<p>No tasks yet.</p>";
    }
    ?>
</body>
</html>
