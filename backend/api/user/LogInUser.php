<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        if(isset($_POST['email']) && isset($_POST['password'])) {
            $email = $_POST['email'];
            $password = $_POST['password'];

            include('../../controller/LoginController.php');

            $login = new LoginController($email, $password);
            $login->fetchUser();
        }
    }
?>