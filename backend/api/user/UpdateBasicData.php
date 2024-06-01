<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        $_POST = json_decode(file_get_contents('php://input'), true);

        if(isset($_POST['data'])) {
            $first_name = $_POST['data']['firstName'];
            $last_name = $_POST['data']['lastName'];
            $position = $_POST['data']['position'];

            include('../../controller/UserController.php');

            $user = new UserController($first_name, $last_name, $position);
    
            echo json_encode($user->setUserBasicData());
        }
    }
?>