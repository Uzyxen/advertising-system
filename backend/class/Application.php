<?php
    include('Database.php');

    class Application extends Database {
        protected function setApplication($user_id, $offer_id) {
            $sql = "INSERT INTO applications (user_id, offer_id) VALUES (?, ?)";
            $stmt = $this->connect()->prepare($sql);

            if($stmt->execute([$user_id, $offer_id])) {
                return true;
            } else {
                return false;
            }
        }

        protected function getApplicationStatus($user_id, $offer_id) {
            $sql = "SELECT application_id FROM applications WHERE user_id = ? AND offer_id = ?";
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$user_id, $offer_id]);

            if($stmt->rowCount() > 0) {
                return true;
            }
            else {
                return false;
            }
        }

        protected function getUserApplications($user_id) {
            $sql = "SELECT o.*, f.*, a.status FROM ogloszenia_firm o JOIN applications a ON o.ogloszenie_id = a.offer_id JOIN companies f ON o.firma_id = f.company_id WHERE a.user_id = ?";
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$user_id]);

            if($stmt->rowCount() > 0) {
                $result = $stmt->fetchAll();

                return $result;
            }
            else {
                return false;
            }
        }

        protected function getApplyingUsers($offer_id, $company_id) {
            $sql = "SELECT users.uzytkownik_id, users.nazwisko, users.numer_telefonu, users.stanowisko, users.email, users.wiek, users.kraj, users.imie FROM users".
            " JOIN applications ON users.uzytkownik_id = applications.user_id".
            " JOIN offers ON applications.offer_id = offers.ogloszenie_id".
            " JOIN companies ON offers.firma_id = companies.company_id".
            " WHERE offers.ogloszenie_id = ? AND companies.company_id = ?";

            $stmt = $this->connect()->prepare($sql);
            $stmt->execute([$offer_id, $company_id]);

            if($stmt->rowCount() > 0) {
                $result = $stmt->fetchAll();

                return $result;
            }
            else {
                return false;
            }
        }
    }
?>