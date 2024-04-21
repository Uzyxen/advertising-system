<?php
    session_start();

    function IsUserLogged() {
        return isset($_SESSION['user_logged']) ? $_SESSION['user_logged'] : false;
    }
?>