<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        include('../../controller/UserController.php');

        $user = new UserController(null, null, null, null, null, null);

        echo json_encode($user->fetchUserLanguages());
    }
?>