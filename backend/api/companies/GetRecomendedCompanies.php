<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        include('../../controller/CompaniesController.php');

        $companies = new CompaniesController(null);

        echo json_encode($companies->fetchRecomendedCompanies());
        
    }
?>