<?php
    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        $_POST = json_decode(file_get_contents('php://input'), true);

        if(isset($_POST['user_id'])) {
            $user_id = $_POST['user_id'];

            include "../../controller/NotificationController.php";

            $notification = new NotificationController(
                "Gratulację!",
                "Firma zaakceptowała twoją aplikację i wkrótce się z Tobą skontaktuje!"
            );

            echo json_encode($notification->sendUserNotification($user_id));
        }
    }
?>