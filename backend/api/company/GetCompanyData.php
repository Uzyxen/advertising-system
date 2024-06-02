<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        include('../../controller/CompanyController.php');

        $company = new CompanyController();

        echo json_encode($company->fetchCompanyData());
    }
?>