<?php
    include('Database.php');

    class Users extends Database {
        protected function getUser($user_id) {
            $sql = "SELECT * FROM users WHERE uzytkownik_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$user_id]);

            if($stmt->rowCount() > 0) {
                $result = $stmt->fetch();

                if($result['is_private'] == 1) {
                    return 'private';
                } else {
                    return $result;
                }
            } else {
                return false;
            }
        }
    }
?>