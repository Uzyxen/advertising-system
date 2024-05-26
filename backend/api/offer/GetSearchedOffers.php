<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        $_POST = json_decode(file_get_contents('php://input'), true);

        if(isset($_POST['value'])) {
            $value = $_POST['value'];

            include('../../controller/SearchController.php');
            $search = new SearchController($value);
    
            echo json_encode($search->fetchOffers());
        }
    }
?>