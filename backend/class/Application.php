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
    }
?>