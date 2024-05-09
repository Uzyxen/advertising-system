<?php
    include('Database.php');

    class User extends Database {
        protected function getUserData($user_id) {
            $sql = "SELECT * FROM uzytkownicy WHERE uzytkownik_id = ?"; 
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