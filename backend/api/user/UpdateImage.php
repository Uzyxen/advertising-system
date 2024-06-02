<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {

        if(isset($_FILES['file'])) {
            $file = $_FILES['file'];

            include('../../controller/UserController.php');

            $user = new UserController(null, null, null, null, null, null);
    
            echo json_encode($user->setUserImage($file));
        }
    }
?>