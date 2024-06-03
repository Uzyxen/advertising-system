<?php
    include('Database.php');

    class Notification extends Database {
        protected function setUserNotification($title, $description, $user_id) {
            $sql = "INSERT INTO notifications (title, description, notification_date, user_id) VALUES (?, ?, now(), ?)";
            $stmt = $this->connect()->prepare($sql);

            if($stmt->execute([$title, $description, $user_id])) {
                return true;
            } else {
                return false;
            }
        }
    }
?>