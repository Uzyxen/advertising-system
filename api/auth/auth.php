<?php
    session_start();

    function IsUserLogged() {
        return isset($_SESSION['user_logged']) ? $_SESSION['user_logged'] : false;
    }

    function IsCompanyLogged() {
        return isset($_SESSION['company_logged']) ? $_SESSION['company_logged'] : false;
    }
?>