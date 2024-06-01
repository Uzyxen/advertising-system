<?php
    require_once(__DIR__ . '/../class/User.php');
    require_once(__DIR__ . '/../class/Session.php');

    class UserController extends User {
        private $session;
        private $first_name;
        private $last_name;
        private $position;
        private $country;
        private $age;
        private $phone_number;
        private $user_id;

        public function __construct($first_name, $last_name, $position, $country, $age, $phone_number) {
            $this->first_name = $first_name;
            $this->last_name = $last_name;
            $this->position = $position;
            $this->country = $country;
            $this->age = $age;
            $this->phone_number = $phone_number;
            $this->session = new Session();
        }

        public function setUserBasicData() {
            if($this->session->check('user_logged') == false) {
                exit();
            }

            if($this->session->check('user_id') == false) {
                exit();
            } else {
                $this->user_id = $this->session->get('user_id');
            }

            return $this->updateBasicData($this->first_name, $this->last_name, $this->position, $this->country, $this->age, $this->phone_number, $this->user_id);
        }

        public function setUserDescription($description) {
            if($this->session->check('user_logged') == false) {
                exit();
            }

            if($this->session->check('user_id') == false) {
                exit();
            } else {
                $this->user_id = $this->session->get('user_id');
            }

            return $this->updateDescription($description, $this->user_id);
        }

        public function setUserSkill($value) {
            if($this->session->check('user_logged') == false) {
                exit();
            }

            if($this->session->check('user_id') == false) {
                exit();
            } else {
                $this->user_id = $this->session->get('user_id');
            }

            return $this->setSkill($value, $this->user_id);
        }

        public function fetchUserData() {
            if($this->session->check('user_logged') == false) {
                exit();
            }

            if($this->session->check('user_id') == false) {
                exit();
            } else {
                $this->user_id = $this->session->get('user_id');
            }

            return $this->getUserData($this->user_id);
        }

        public function fetchUserSkills() {
            if($this->session->check('user_logged') == false) {
                exit();
            }

            if($this->session->check('user_id') == false) {
                exit();
            } else {
                $this->user_id = $this->session->get('user_id');
            }

            return $this->getUserSkills($this->user_id);
        }

        public function fetchUserExperience() {
            if($this->session->check('user_logged') == false) {
                exit();
            }

            if($this->session->check('user_id') == false) {
                exit();
            } else {
                $this->user_id = $this->session->get('user_id');
            }

            return $this->getUserExprerience($this->user_id);
        }
    }
?>