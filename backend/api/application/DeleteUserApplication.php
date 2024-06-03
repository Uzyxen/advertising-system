<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        $_POST = json_decode(file_get_contents('php://input'), true);

        if(isset($_POST['application_id'])) {
            $application_id = $_POST['application_id'];

            include "../../controller/ApplicationController.php";

            $application = new ApplicationController(null);
            echo json_encode($application->deleteUserApplication($application_id));
        }
    }
?>