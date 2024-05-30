<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        $_POST = json_decode(file_get_contents('php://input'), true);

        if((isset($_POST['id']))) {
            $id = $_POST['id'];

            include('../../controller/UsersController.php');

            $users = new UsersController($id);
    
            echo json_encode($users->fetchUserData());
        }
    }
?>