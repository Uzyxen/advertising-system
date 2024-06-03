<?php
    require_once(__DIR__ . '/../class/Notification.php');
    require_once(__DIR__ . '/../class/Session.php');

    class NotificationController extends Notification {
        private $session;
        private $title;
        private $description;

        public function __construct($title, $description)
        {
            $this->session = new Session();
            $this->title = $title;
            $this->description = $description;
        }

        public function sendUserNotification($user_id) {
            return $this->setUserNotification($this->title, $this->description, $user_id);
        }

        public function getNotifications() {
            if($this->session->check('user_logged')) {
                if($this->session->check('user_id')) {
                    $user_id = $this->session->get('user_id');

                    return $this->getUserNotifications($user_id);
                }
            } else if($this->session->check('company_logged')) {
                if($this->session->check('company_id')) {
                    $company_id = $this->session->get('company_id');

                    return $this->getCompanyNotifications($company_id);
                }
            } else {
                exit();
            }
        }
    }
?>