<?php
    include('../../class/Session.php');

    if($_SERVER['REQUEST_METHOD'] === 'POST') {
        $session = new Session();
        $session->destroy();

        echo json_encode('success');
    }
?>