<?php
    require_once(__DIR__ . '/../class/Register.php');
    require_once(__DIR__ . '/../class/Response.php');

    class RegisterController extends Register {
        private $email;
        private $password;
        private $password_2;

        private $response;

        public function __construct($email, $password, $password_2)
        {
            $this->email = $email;
            $this->password = $password;
            $this->password_2 = $password_2;

            $this->response = new Response();
        }

        public function createUser() {
            if($this->emptyInput() == false) {
                exit();
            }

            if($this->checkEmail($this->email) == false) {
                return $this->response->getResponse('failure', 'Adres "' . $this->email . '" jest już używany');

                exit();
            }

            if($this->validateEmail() == false) {
                exit();
            }

            if($this->matchPassword() == false) {
                exit();
            }

            $this->setUser($this->email, $this->password);
        }

        private function emptyInput() {
            $result = false;

            if(empty($this->email) || empty($this->password) || empty($this->password_2)) {
                $result = false;
            }
            else {
                $result = true;
            }

            return $result;
        }

        private function validateEmail() {
            $result = false;

            if(!filter_var($this->email, FILTER_VALIDATE_EMAIL)) {
                $result = false;
            } 
            else {
                $result = true;
            }

            return $result;
        }

        private function matchPassword() {
            $result = false;

            if($this->password !== $this->password_2) {
                $result = false;
            } 
            else {
                $result = true;
            }

            return $result;
        }
    }

?>