<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        $_POST = json_decode(file_get_contents('php://input'), true);

        if(isset($_POST['email']) && isset($_POST['password']) && isset($_POST['password_2'])) {
            $email = $_POST['email'];
            $password = $_POST['password'];
            $password_2 = $_POST['password_2'];

            include "../../controller/RegisterController.php";

            $register = new RegisterController($email, $password, $password_2);
            echo json_encode($register->createUser());
        }
    }
?>