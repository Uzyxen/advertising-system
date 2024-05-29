<?php
    include('Database.php');

    class Offer extends Database {
        protected function getOfferData($id) {
            $sql = 'SELECT offers.*, companies.nazwa_firmy FROM offers INNER JOIN companies ON companies.company_id = offers.firma_id WHERE ogloszenie_id = ?';
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

            $sql = 'SELECT zdjecie_url, ogloszenie_id, tytul, opis, umowa, lokalizacja, wynagrodzenie_min, wynagrodzenie_max, czestotliwosc_wynagrodzenia, DATE_FORMAT(data_dodania, "%e %M %Y") AS data_dodania, data_dodania AS data_sort, (SELECT nazwa_firmy FROM companies WHERE company_id = offers.firma_id) AS firma FROM offers';
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute();

            if($stmt->rowCount() > 0) {
                $result = $stmt->fetchAll();

                return $result;
            } else {
                return false;
            }
        }

        protected function getCompanyOffers($company_id) {
            $l_stmt = $this->connect()->prepare('SET lc_time_names = "pl_PL"');
            $l_stmt->execute();

            $sql = 'SELECT zdjecie_url, ogloszenie_id, tytul, opis, umowa, lokalizacja, wynagrodzenie_min, wynagrodzenie_max, czestotliwosc_wynagrodzenia, DATE_FORMAT(data_dodania, "%e %M %Y") AS data_dodania, data_dodania AS data_sort, (SELECT nazwa_firmy FROM companies WHERE company_id = ?) AS firma FROM offers';
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$company_id]);

            if($stmt->rowCount() > 0) {
                $result = $stmt->fetchAll();

                return $result;
            } else {
                return false;
            }
        }

        protected function setOfferApply($user_id, $offer_id) {
            $sql = "INSERT INTO applications (user_id, offer_id) VALUES (?, ?)";
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$user_id, $offer_id]);
        }

        protected function removeOffer($offer_id) {
            $sql = "DELETE FROM offers WHERE ogloszenie_id = ?";
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$offer_id]);
        }
    }
?>