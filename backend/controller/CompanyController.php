<?php
    require_once(__DIR__ . '/../class/Company.php');
    require_once(__DIR__ . '/../class/Session.php');

    class CompanyController extends Company {
        private $company_id;
        private $session;

        public function __construct() {
            $this->session = new Session();
        }

        public function setCompanyBasicData($name, $email, $country, $nip, $remote) {
            if($this->session->check('company_logged') == false) {
                exit();
            }

            if($this->session->check('company_id') == false) {
                exit();
            } else {
                $this->company_id = $this->session->get('company_id');
            }

            return $this->updateBasicData($name, $email, $country, $nip, $remote, $this->company_id);
        }

        public function setCompanyImage($image) {
            if($this->session->check('company_logged') == false) {
                exit();
            }

            if($this->session->check('company_id') == false) {
                exit();
            } else {
                $this->company_id = $this->session->get('company_id');
            }

            return $this->setImage($image, $this->company_id);
        }

        public function setCompanyDescription($description) {
            if($this->session->check('company_logged') == false) {
                exit();
            }

            if($this->session->check('company_id') == false) {
                exit();
            } else {
                $this->company_id = $this->session->get('company_id');
            }

            return $this->updateDescription($description, $this->company_id);
        }

        public function fetchCompanyData() {
            if($this->session->check('company_logged') == false) {
                exit();
            }

            if($this->session->check('company_id') == false) {
                exit();
            } else {
                $this->company_id = $this->session->get('company_id');
            }

            return $this->getCompanyData($this->company_id);
        }

        public function fetchCompanyTechnologies() {
            if($this->session->check('company_logged') == false) {
                exit();
            }

            if($this->session->check('company_id') == false) {
                exit();
            } else {
                $this->company_id = $this->session->get('company_id');
            }

            return $this->getCompanyTechnologies($this->company_id);
        }

        public function setCompanyTechnology($value) {
            if($this->session->check('company_logged') == false) {
                exit();
            }

            if($this->session->check('company_id') == false) {
                exit();
            } else {
                $this->company_id = $this->session->get('company_id');
            }

            return $this->setTechnology($value, $this->company_id);
        }

        public function deleteCompanyTechnology($id) {
            if($this->session->check('company_logged') == false) {
                exit();
            }

            if($this->session->check('company_id') == false) {
                exit();
            } else {
                $this->company_id = $this->session->get('company_id');
            }

            return $this->removeTechnology($id, $this->company_id);
        }
    }
?>