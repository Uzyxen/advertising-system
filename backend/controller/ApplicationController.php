<?php
    require_once(__DIR__ . '/../class/Application.php');
    require_once(__DIR__ . '/../class/Session.php');

    class ApplicationController extends Application {
        private $session;
        private $user_id;
        private $offer_id;

        public function __construct($offer_id)
        {
            $this->session = new Session();
            $this->offer_id = $offer_id;
        }

        public function createApplication() {
            if($this->session->check('user_logged') == false) {
                exit();
            }

            if($this->session->check('user_id') == false) {
                exit();
            } else {
                $this->user_id = $this->session->get('user_id');
            }

            if($this->getApplicationStatus($this->user_id, $this->offer_id) == true) {
                exit();
            }
            
            return $this->setApplication($this->user_id, $this->offer_id);
        }

        public function fetchApplicationStatus() {
            if($this->session->check('user_logged') == false) {
                exit();
            }

            if($this->session->check('user_id') == false) {
                exit();
            } else {
                $this->user_id = $this->session->get('user_id');
            }

            return $this->getApplicationStatus($this->user_id, $this->offer_id);
        }
    }
?>