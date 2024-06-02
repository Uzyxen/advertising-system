<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        $_POST = json_decode(file_get_contents('php://input'), true);

        if(isset($_POST['technology'])) {
            $technology = $_POST['technology'];

            include('../../controller/CompanyController.php');

            $company = new CompanyController();
    
            echo json_encode($company->setCompanyTechnology($technology));
        }
    }
?>