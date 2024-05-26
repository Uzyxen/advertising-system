<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        include('../../controller/OfferController.php');

        $offer = new OfferController(0);

        echo json_encode($offer->fetchCompanyOffers());
    }
?>