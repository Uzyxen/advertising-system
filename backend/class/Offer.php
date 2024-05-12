<?php
    include('Database.php');

    class Offer extends Database {
        protected function getOfferData($id) {
            $sql = 'SELECT * FROM ogloszenia_firm WHERE ogloszenie_id = ?';
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$id]);
                        
            if($stmt->rowCount() > 0) { // found offer
                $result = $stmt->fetch();

                return $result;
            } else {
                return false;
            }
        }
    }
?>