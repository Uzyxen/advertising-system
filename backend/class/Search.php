<?php
    include('Database.php');

    class Search extends Database {
        protected function getOffers($value) {
            $search_item = '%' . $value . '%';

            $sql = "SELECT * FROM offers WHERE tytul LIKE ? OR OPIS LIKE ?"; 
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$search_item, $search_item]);

            if($stmt->rowCount() > 0) {
                $results = $stmt->fetchAll();

                return $results;
            }
        }
    }
?>