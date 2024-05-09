<?php
    include('Database.php');
    include('Session.php');

    class Login extends Database {
        private $session;

        protected function getUser($email, $password) {
            $sql = "SELECT uzytkownik_id, password FROM uzytkownicy WHERE email = ?";
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$email]);
            
            if($stmt->rowCount() > 0) { // found user
                $result = $stmt->fetchAll();

                if(password_verify($password, $result[0]['password'])) {
                    $this->session = new Session();
                    $this->session->regenerateID(); // regenerate id after login
                    $this->session->set('user_logged', true); // set user_logged flag to true
                    $this->session->set('user_id', $result[0]['uzytkownik_id']);

                    return true;
                } else {
                    return false;
                }
            }
        }
    }
?>