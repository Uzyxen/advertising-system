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
        
        
        protected function setImage($image, $user_id) {
            $sql = "UPDATE users SET image_url = ? WHERE uzytkownik_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            $uploadDirectory = __DIR__ . '/../../public/user/';
            $uploadFile = $uploadDirectory . basename($image['name']);

            if (!is_dir($uploadDirectory)) {
                mkdir($uploadDirectory, 0777, true);
            }

            if (move_uploaded_file($image['tmp_name'], $uploadFile)) { 
                $fileName = basename($image['name']);

                if($stmt->execute([$fileName, $user_id])) {
                    return true;
                } else {
                    return false;
                }
            }
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

        protected function setExperience($data, $user_id) {
            $sql = "INSERT INTO doswiadczenie (data_poczatek, data_koniec, stanowisko, opis, firma, lokalizacja, uzytkownik_id) VALUES (?, ?, ?, ?, ?, ?, ?)"; 
            $stmt = $this->connect()->prepare($sql);

            if($stmt->execute([$data['date_start'], $data['date_end'], $data['position'], $data['description'], $data['company'], $data['location'], $user_id])) {
                return true;
            } else {
                return false;
            }
        }

        protected function setLanguage($data, $user_id) {
            $sql = "INSERT INTO languages (language, level, user_id) VALUES (?, ?, ?)"; 
            $stmt = $this->connect()->prepare($sql);

            if($stmt->execute([$data['language'], $data['level'], $user_id])) {
                return $data;
            } else {
                return false;
            }
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

        protected function getUserData($user_id) {
            $sql = "SELECT * FROM users WHERE uzytkownik_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$user_id]);
            $result = $stmt->fetch();

            return $result;
        }

        protected function getUserSkills($user_id) {
            $sql = "SELECT skill, skill_id FROM skills WHERE user_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$user_id]);
            $result = $stmt->fetchAll();

            return $result;
        }

        protected function getUserExprerience($user_id) {
            $sql = "SELECT doswiadczenie_id, data_poczatek, data_koniec, stanowisko, opis, firma, lokalizacja FROM doswiadczenie WHERE uzytkownik_id = ? ORDER BY data_poczatek ASC"; 
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$user_id]);
            $result = $stmt->fetchAll();

            return $result;
        }

        protected function removeExperience($id, $user_id) {
            $sql = "DELETE FROM doswiadczenie WHERE doswiadczenie_id = ? AND uzytkownik_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            if($stmt->execute([$id, $user_id])) {
                return $id;
            } else {
                return false;
            }
        }

        protected function removeLanguage($id, $user_id) {
            $sql = "DELETE FROM languages WHERE language_id = ? AND user_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            if($stmt->execute([$id, $user_id])) {
                return $id;
            } else {
                return false;
            }
        }

        protected function getUserLinks($user_id) {
            $sql = "SELECT link, link_url, link_id FROM links WHERE user_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$user_id]);
            $result = $stmt->fetchAll();

            return $result;
        }

        
        protected function getUserEducation($user_id) {
            $sql = "SELECT * FROM education WHERE user_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$user_id]);
            $result = $stmt->fetchAll();

            return $result;
        }

        protected function getUserLanguages($user_id) {
            $sql = "SELECT * FROM languages WHERE user_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$user_id]);
            $result = $stmt->fetchAll();

            return $result;
        }
    }
?>