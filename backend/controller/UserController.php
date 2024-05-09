<?php
    require_once(__DIR__ . '/../class/User.php');
    require_once(__DIR__ . '/../class/Session.php');

    class UserController extends User {
        private $session;
        private $user_id;

        public function __construct() {
            $this->session = new Session();
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
    }
?>