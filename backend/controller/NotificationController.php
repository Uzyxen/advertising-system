<?php
    require_once(__DIR__ . '/../class/Notification.php');
    require_once(__DIR__ . '/../class/Session.php');

    class NotificationController extends Notification {
        private $title;
        private $description;

        public function __construct($title, $description)
        {
            $this->title = $title;
            $this->description = $description;
        }

        public function sendUserNotification($user_id) {
            return $this->setUserNotification($this->title, $this->description, $user_id);
        }
    }
?>