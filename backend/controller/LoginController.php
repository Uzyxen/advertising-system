<?php
    require_once(__DIR__ . '/../class/Login.php');
    require_once(__DIR__ . '/../class/Response.php');

    class LoginController extends Login {
        private $email;
        private $password;

        public function __construct($email, $password)
        {
            $this->email = $email;
            $this->password = $password;
        }

        public function fetchUser() {
            if($this->emptyInput() == true) {
                exit();
            }

            if($this->getUser($this->email, $this->password)) {
                return 'success';
            } else {
                return 'failure';
            }
        }

        public function fetchCompany() {
            if($this->emptyInput() == true) {
                exit();
            }

            if($this->getCompany($this->email, $this->password)) {
                return 'success';
            } else {
                return 'failure';
            }
        }

        private function emptyInput() {
            if(empty($this->email) || empty($this->password)) {
                return true;
            } 
            else {
                return false;
            }
        }
    }
?>