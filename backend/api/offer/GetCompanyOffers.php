<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        include('../../controller/OfferController.php');

        $offer = new OfferController(null, null);

        echo json_encode($offer->fetchCompanyOffers());
    }
?>