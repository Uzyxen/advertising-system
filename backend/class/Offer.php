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

            $sql = 'SELECT zdjecie_url, ogloszenie_id, tytul, opis, umowa, job_level, lokalizacja, wynagrodzenie_min, wynagrodzenie_max, czestotliwosc_wynagrodzenia, DATE_FORMAT(data_dodania, "%e %M %Y") AS data_dodania, data_dodania AS data_sort, (SELECT nazwa_firmy FROM companies WHERE company_id = offers.firma_id) AS firma FROM offers';
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

        protected function setOfferApply($user_id, $offer_id) {
            $sql = "INSERT INTO applications (user_id, offer_id) VALUES (?, ?)";
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$user_id, $offer_id]);
        }

        protected function setOffer($data, $company_id) {  
            $categories_sql = "SELECT kategoria_id FROM kategorie WHERE name = ?";
            $categories_stmt = $this->connect()->prepare($categories_sql);
            $categories_stmt->execute([$data['category']]);

            $result = $categories_stmt->fetch();

            if($result) {
                $image_sql = "SELECT zdjecie_url FROM companies WHERE company_id = ?";
                $image_stmt = $this->connect()->prepare($image_sql);

                $image_stmt->execute([$company_id]);
                $image_result = $image_stmt->fetch();
    
                if($image_result) {
                    $sql = "INSERT INTO offers (zdjecie_url, tytul, opis, umowa, employment_type, job_mode, lokalizacja, wynagrodzenie_min, wynagrodzenie_max, czestotliwosc_wynagrodzenia, data_dodania, kategoria_id, firma_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?)";
                    $stmt = $this->connect()->prepare($sql);
    
                    if($stmt->execute([$image_result['zdjecie_url'], $data['title'], $data['description'], $data['contractType'], $data['type'], $data['mode'], $data['location'], $data['salaryMin'], $data['salaryMax'], $data['frequency'], $result['kategoria_id'], $company_id])) {
                        $last_id = $this->connect()->lastInsertId();

                        $duties_sql = "INSERT INTO duties (duty, offer_id) VALUES (?, ?)";
                        $duties_stmt = $this->connect()->prepare($duties_sql);

                        foreach($data['duties'] as $duty) {
                            if(!empty($duty['text']))
                                $duties_stmt->execute([$duty['text'], $last_id]);
                        }

                        $requirements_sql = "INSERT INTO requirements (requirement, offer_id) VALUES (?, ?)";
                        $requirements_stmt = $this->connect()->prepare($requirements_sql);

                        foreach($data['requirements'] as $requirement) {
                            if(!empty($requirement['text']))
                                $requirements_stmt->execute([$requirement['text'], $last_id]);
                        }

                       return true;
                    }
                }
            } else {
                return false;
            }
        }

        protected function getOfferRequirements($offer_id) {
            $sql = "SELECT requirement, requirement_id FROM requirements WHERE offer_id = ?";
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$offer_id]);

            if($stmt->rowCount() > 0) {
                $result = $stmt->fetchAll();

                return $result;
            } else {
                return false;
            }
        }

        protected function getOfferDuties($offer_id) {
            $sql = "SELECT duty, duty_id FROM duties WHERE offer_id = ?";
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$offer_id]);

            if($stmt->rowCount() > 0) {
                $result = $stmt->fetchAll();

                return $result;
            } else {
                return false;
            }
        }

        protected function removeOffer($offer_id) {
            $sql = "DELETE FROM offers WHERE ogloszenie_id = ?";
            $stmt = $this->connect()->prepare($sql);

            if($stmt->execute([$offer_id])) {
                return true;
            } else {
                return false;
            }
        }
    }
?>