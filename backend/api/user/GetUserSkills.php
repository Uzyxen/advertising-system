<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        include('../../controller/UserController.php');

        $user = new UserController();

        echo json_encode($user->fetchUserSkills());
    }
?>