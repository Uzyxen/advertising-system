<?php
    include 'Database.php';

    class Register extends Database {
        protected function checkEmail($email) {
            $sql = "SELECT email FROM users WHERE email = ?";
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

        protected function checkCompanyEmail($email) {
            $sql = "SELECT email FROM companies WHERE email = ?";
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

            $sql = "INSERT INTO users (email, password) VALUES (?, ?)";
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$email, $hash]);
        }

        protected function setCompany($email, $password, $NIP) {
            $hash = password_hash($password, PASSWORD_DEFAULT); // hash password

            $sql = "INSERT INTO companies (email, password, NIP) VALUES (?, ?, ?)";
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$email, $hash, $NIP]);
        }
    }
?>