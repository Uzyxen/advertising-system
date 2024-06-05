<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        include('../../controller/JobController.php');

        $job = new JobController();

        echo json_encode($job->fetchEmploymentTypes());
    }
?>