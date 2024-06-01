<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        $_POST = json_decode(file_get_contents('php://input'), true);

        if(isset($_POST['data'])) {
            $first_name = $_POST['data']['firstName'];
            $last_name = $_POST['data']['lastName'];
            $position = $_POST['data']['position'];
            $country = $_POST['data']['country'];
            $age = $_POST['data']['age'];
            $phone_number = $_POST['data']['phoneNumber'];

            include('../../controller/UserController.php');

            $user = new UserController($first_name, $last_name, $position, $country, $age, $phone_number);
    
            echo json_encode($user->setUserBasicData());
        }
    }
?>