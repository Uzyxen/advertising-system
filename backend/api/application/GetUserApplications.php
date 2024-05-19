<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        include "../../controller/ApplicationController.php";

        $application = new ApplicationController(null);

        echo json_encode($application->fetchUserApplications());
    }
?>