<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        $_POST = json_decode(file_get_contents('php://input'), true);

        if(isset($_POST['data'])) {
            $name = $_POST['data']['name'];
            $country = $_POST['data']['country'];
            $nip = $_POST['data']['nip'];
            $email = $_POST['data']['email'];
            $remote = $_POST['data']['remote'];

            include('../../controller/CompanyController.php');

            $company = new CompanyController();
    
            echo json_encode($company->setCompanyBasicData($name, $email, $country, $nip, $remote));
        }
    }
?>