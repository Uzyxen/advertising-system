<?php
    require_once(__DIR__ . '/../class/Users.php');

    class UsersController extends Users {
        private $user_id;

        public function __construct($user_id)
        {
            $this->user_id = $user_id;
        }

        public function fetchUserData() {
            return $this->getUser($this->user_id);
        }
    }
?>