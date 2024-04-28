<?php
    include('../class/Session.php');
    include('../class/security/CSRF.php');

    $session = new Session();
    $user_logged = $session->get('user_logged');

    if($user_logged) {
        echo json_encode([ 'user_logged' => true ]);
    } else {
        echo json_encode([ 'user_logged' => false ]);
    }
?>