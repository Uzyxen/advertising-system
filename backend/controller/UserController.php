<?php
    require_once(__DIR__ . '/../class/User.php');
    require_once(__DIR__ . '/../class/Session.php');

    class UserController extends User {
        private $session;
        private $first_name;
        private $last_name;
        private $position;
        private $user_id;

        public function __construct($first_name, $last_name, $position) {
            $this->first_name = $first_name;
            $this->last_name = $last_name;
            $this->position = $position;
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

            return $this->updateBasicData($this->first_name, $this->last_name, $this->position, $this->user_id);
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