<?php
    include 'Database.php';

    class Login extends Database {
        protected function getUser($email, $password) {
            $sql = "SELECT email FROM uzytkownicy WHERE email = ? AND password = ?";
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$email, $password]);
        }
    }

?>