<?php
    include('Database.php');

    class User extends Database {
        protected function updateBasicData($first_name, $last_name, $position, $country, $age, $phone_number, $user_id) {
            $sql = "UPDATE users SET imie = ?, nazwisko = ?, stanowisko = ?, kraj = ?, wiek = ?, numer_telefonu = ? WHERE uzytkownik_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            if($stmt->execute([$first_name, $last_name, $position, $country, $age, $phone_number, $user_id])) {
                return true;
            }

            return false;
        }

        protected function updateDescription($description, $user_id) {
            $sql = "UPDATE users SET opis = ? WHERE uzytkownik_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            if($stmt->execute([$description, $user_id])) {
                return $description;
            }

            return false;
        }

        protected function getUserData($user_id) {
            $sql = "SELECT * FROM users WHERE uzytkownik_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$user_id]);
            $result = $stmt->fetch();

            return $result;
        }

        protected function getUserSkills($user_id) {
            $sql = "SELECT umiejetnosc FROM umiejetnosci WHERE uzytkownik_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$user_id]);
            $result = $stmt->fetchAll();

            return $result;
        }

        protected function getUserExprerience($user_id) {
            $sql = "SELECT data_poczatek, data_koniec, stanowisko, opis, firma, lokalizacja FROM doswiadczenie WHERE uzytkownik_id = ? ORDER BY data_poczatek ASC"; 
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$user_id]);
            $result = $stmt->fetchAll();

            return $result;
        }
    }
?>