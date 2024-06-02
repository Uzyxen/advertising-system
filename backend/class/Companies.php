<?php
    include('Database.php');

    class Companies extends Database {
        protected function getCompany($company_id) {
            $sql = "SELECT * FROM companies WHERE company_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$company_id]);

            if($stmt->rowCount() > 0) {
                $result = $stmt->fetch();

                return $result;
            } else {
                return false;
            }
        }

        protected function getCompanyOfferQuantity($company_id) {
            $sql = "SELECT COUNT(*) as value FROM offers WHERE firma_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$company_id]);
            $result = $stmt->fetch();

            return $result;
        }

        protected function getCompanyTechnologies($company_id) {
            $sql = "SELECT technology, technology_id FROM technologies WHERE company_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$company_id]);
            $result = $stmt->fetchAll();

            return $result;
        }

        protected function getCompanyOffers($company_id) {
            $l_stmt = $this->connect()->prepare('SET lc_time_names = "pl_PL"');
            $l_stmt->execute();

            $sql = 'SELECT zdjecie_url, ogloszenie_id, tytul, opis, umowa, lokalizacja, wynagrodzenie_min, wynagrodzenie_max, czestotliwosc_wynagrodzenia, DATE_FORMAT(data_dodania, "%e %M %Y") AS data_dodania, data_dodania AS data_sort, (SELECT nazwa_firmy FROM companies WHERE company_id = ?) AS firma FROM offers WHERE firma_id = ?';
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$company_id, $company_id]);

            if($stmt->rowCount() > 0) {
                $result = $stmt->fetchAll();

                return $result;
            } else {
                return false;
            }
        }
    }
?>