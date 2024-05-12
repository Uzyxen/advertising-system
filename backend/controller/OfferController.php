<?php
    require_once(__DIR__ . '/../class/Offer.php');

    class OfferController extends Offer {
        private $id;

        public function __construct($id)
        {
            $this->id = $id;
        }

        public function fetchOfferData() {
            return $this->getOfferData($this->id);
        }
    }
?>