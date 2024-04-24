<?php
    include_once 'Database.php';

    class User extends Database {
        public function getUser() {

        }

        public function createUser($email, $password) {
            $hash = password_hash($password, PASSWORD_DEFAULT); // hash password

            $sql = "INSERT INTO uzytkownicy (email, password) VALUES (?, ?)";
            $stmt = $this->connect()->prepare($sql);

            $result = $stmt->execute([$email, $hash]);

            return $result;
        }
    }
?>