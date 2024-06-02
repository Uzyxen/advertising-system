<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        $_POST = json_decode(file_get_contents('php://input'), true);

        if(isset($_POST['id'])) {
            $id = $_POST['id'];

            include('../../controller/CompanyController.php');

            $company = new CompanyController();
    
            echo json_encode($company->deleteCompanyTechnology($id));
        }
    }
?>