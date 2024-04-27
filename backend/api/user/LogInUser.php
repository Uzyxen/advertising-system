<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        $_POST = json_decode(file_get_contents('php://input'), true);

        if(isset($_POST['email']) && isset($_POST['password'])) {
            $email = $_POST['email'];
            $password = $_POST['password'];

            include('../../controller/LoginController.php');

            $login = new LoginController($email, $password);
            
            echo json_encode($login->fetchUser());
        }
    }
?>