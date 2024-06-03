<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        $_POST = json_decode(file_get_contents('php://input'), true);

        include "../../controller/NotificationController.php";

        $notification = new NotificationController(null, null);
        echo json_encode($notification->getNotifications());
    }
?>