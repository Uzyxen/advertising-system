<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        $_POST = json_decode(file_get_contents('php://input'), true);

        if(isset($_POST['id'])) {
            $offer_id = $_POST['id'];

            include('../../controller/OfferController.php');
            $offer = new OfferController($offer_id);
    
            echo json_encode($offer->fetchOfferData());
        }
    }
?>