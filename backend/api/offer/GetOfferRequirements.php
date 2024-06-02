<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        $_POST = json_decode(file_get_contents('php://input'), true);

        if(isset($_POST['offer_id'])) {
            $offer_id = $_POST['offer_id'];

            include('../../controller/OfferController.php');
            $offer = new OfferController($offer_id, null);
    
            echo json_encode($offer->fetchOfferRequirements());
        }
    }
?>