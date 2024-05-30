<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        $_POST = json_decode(file_get_contents('php://input'), true);

        if(isset($_POST['data'])) {
            $data = $_POST['data'];

            include('../../controller/OfferController.php');
            $offer = new OfferController(null, $data);

            echo json_encode($offer->createOffer());
        }
    }
?>