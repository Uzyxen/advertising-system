<?php
    include 'Database.php';

    class Login extends Database {
        protected function getUser($email, $password) {
            $sql = "SELECT password FROM uzytkownicy WHERE email = ?";
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$email, $password]);
            
            if($stmt->rowCount() > 0) { // found user
                $result = $stmt->fetchAll();

                if(password_verify($password, $result['password'])) {
                    echo json_encode('zalogowano');
                } else {
                    echo json_encode('nie zalogowano');
                }
            }
        }
    }
?>