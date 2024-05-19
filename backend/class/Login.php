<?php
    include('Database.php');
    include('Session.php');

    class Login extends Database {
        private $session;

        protected function getUser($email, $password) {
            $sql = "SELECT uzytkownik_id, password FROM users WHERE email = ?";
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

        protected function getCompany($email, $password) {
            $sql = "SELECT company_id, password FROM companies WHERE email = ?";
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$email]);
            
            if($stmt->rowCount() > 0) { // found company
                $result = $stmt->fetchAll();

                if(password_verify($password, $result[0]['password'])) {
                    $this->session = new Session();
                    $this->session->regenerateID();
                    $this->session->set('company_logged', true);
                    $this->session->set('company_id', $result[0]['company_id']);

                    return true;
                } else {
                    return false;
                }
            }
        }
    }
?>