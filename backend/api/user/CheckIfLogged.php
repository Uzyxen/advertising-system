<?php
    include('../../class/Session.php');

    $session = new Session();

    if($session->get('user_logged')) {
        echo json_encode([ 'logged' => true ]);
    } else {
        echo json_encode([ 'logged' => false ]);
    }
?>