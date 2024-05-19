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
    }
?>