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

        protected function getUserNotifications($user_id) {
            $sql = "SELECT * FROM notifications WHERE user_id = ?";
            $stmt = $this->connect()->prepare($sql);

            if($stmt->execute([$user_id])) {
                $result = $stmt->fetchAll();

                return $result;
            } else {
                return false;
            }
        }

        protected function getCompanyNotifications($company_id) {
            $sql = "SELECT * FROM notifications WHERE company_id = ?";
            $stmt = $this->connect()->prepare($sql);

            if($stmt->execute([$company_id])) {
                $result = $stmt->fetchAll();

                return $result;
            } else {
                return false;
            }
        }
    }
?>