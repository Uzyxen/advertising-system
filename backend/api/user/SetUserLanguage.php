<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        $_POST = json_decode(file_get_contents('php://input'), true);

        if(isset($_POST['data'])) {
            $data = $_POST['data'];

            include('../../controller/UserController.php');

            $user = new UserController(null, null, null, null, null, null);
    
            echo json_encode($user->setUserLanguage($data));
        }
    }
?>