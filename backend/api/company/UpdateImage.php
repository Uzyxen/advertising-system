<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {

        if(isset($_FILES['file'])) {
            $file = $_FILES['file'];

            include('../../controller/CompanyController.php');

            $company = new CompanyController();
    
            echo json_encode($company->setCompanyImage($file));
        }
    }
?>