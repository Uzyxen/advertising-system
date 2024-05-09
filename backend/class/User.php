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
    }
?>