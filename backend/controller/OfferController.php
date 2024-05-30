<?php
    require_once(__DIR__ . '/../class/Offer.php');
    require_once(__DIR__ . '/../class/Session.php');

    class OfferController extends Offer {
        private $id;
        private $session;
        private $data;
        private $company_id;

        public function __construct($id, $data)
        {
            $this->id = $id;
            $this->data = $data;
            $this->session = new Session();
        }

        public function fetchOfferData() {
            return $this->getOfferData($this->id);
        }

        public function fetchOffers() {
            return $this->getOffers();
        }

        public function deleteOffer() {
            return $this->removeOffer($this->id);
        }

        public function createOffer() {
            if($this->session->check('company_logged') == false) {
                exit();
            }

            if($this->session->check('company_id') == false) {
                exit();
            } else {
                $this->company_id = $this->session->get('company_id');
            }

            return $this->setOffer($this->data, $this->company_id);
        }

        public function fetchCompanyOffers() {
            if($this->session->check('company_logged') == false) {
                exit();
            }

            if($this->session->check('company_id') == false) {
                exit();
            } else {
                $this->company_id = $this->session->get('company_id');
            }

            return $this->getCompanyOffers($this->company_id);
        }
    }
?>