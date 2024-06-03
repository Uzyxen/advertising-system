<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        $_POST = json_decode(file_get_contents('php://input'), true);

        if(isset($_POST['data'])) {
            $application_id = $_POST['data']['applicationId'];
            $user_id = $_POST['data']['userId'];

            include "../../controller/ApplicationController.php";

            $application = new ApplicationController(null);
            echo json_encode($application->confirmUserApplication($application_id, $user_id));
        }
    }
?>