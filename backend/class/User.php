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

        protected function setSkill($value, $user_id) {
            $sql = "INSERT INTO skills (skill, user_id) VALUES (?, ?)"; 
            $stmt = $this->connect()->prepare($sql);

            if($stmt->execute([$value, $user_id])) {
                return $value;
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

        protected function removeSkill($id, $user_id) {
            $sql = "DELETE FROM skills WHERE skill_id = ? AND user_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            if($stmt->execute([$id, $user_id])) {
                return $id;
            } else {
                return false;
            }
        }

        protected function getUserSkills($user_id) {
            $sql = "SELECT skill, skill_id FROM skills WHERE user_id = ?"; 
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