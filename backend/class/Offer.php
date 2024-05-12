<?php
    include('Database.php');

    class Offer extends Database {
        protected function getOfferData($id) {
            $sql = 'SELECT ogloszenia_firm.*, firmy.nazwa_firmy FROM ogloszenia_firm INNER JOIN firmy ON firmy.firma_id = ogloszenia_firm.firma_id WHERE ogloszenie_id = ?';
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$id]);
                        
            if($stmt->rowCount() > 0) { // found offer
                $result = $stmt->fetch();

                return $result;
            } else {
                return false;
            }
        }

        protected function getOffers() {
            $l_stmt = $this->connect()->prepare('SET lc_time_names = "pl_PL"');
            $l_stmt->execute();

            $sql = 'SELECT zdjecie_url, ogloszenie_id, tytul, opis, umowa, lokalizacja, wynagrodzenie_min, wynagrodzenie_max, czestotliwosc_wynagrodzenia, DATE_FORMAT(data_dodania, "%e %M %Y") AS data_dodania, data_dodania AS data_sort, (SELECT nazwa_firmy FROM firmy WHERE firma_id = ogloszenia_firm.firma_id) AS firma FROM ogloszenia_firm';
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute();

            if($stmt->rowCount() > 0) {
                $result = $stmt->fetchAll();

                return $result;
            } else {
                return false;
            }
        }
    }
?>