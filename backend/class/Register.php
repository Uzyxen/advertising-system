<?php
    include 'Database.php';

    class Register extends Database {
        protected function checkEmail($email) {
            $sql = "SELECT email FROM uzytkownicy WHERE email = ?";
            $stmt = $this->connect()->prepare($sql);

            if(!$stmt->execute([$email])) {
                $sql = "";
                $stmt = null;

                exit();
            }

            $result = false;

            if($stmt->rowCount() > 0) {
                $result = false;
            }
            else {
                $result = true;
            }

            return $result;
        }

        protected function setUser($email, $password) {
            $hash = password_hash($password, PASSWORD_DEFAULT); // hash password

            $sql = "INSERT INTO uzytkownicy (email, password) VALUES (?, ?)";
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$email, $hash]);
        }
    }
?>