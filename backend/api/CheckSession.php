<?php
    include('../class/Session.php');

    $session = new Session();
    $session->set('token', md5(uniqid(mt_rand(), true)));

    echo json_encode($_SESSION['token']);

?>