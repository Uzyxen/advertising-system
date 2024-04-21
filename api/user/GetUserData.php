<?php
    require_once '../auth/auth.php';

    if(IsUserLogged()) {
        echo json_encode(['data' => [
            'logged' => $_SESSION['user_logged'], 
            'first_name' => $_SESSION['imie'], 
            'last_name' => $_SESSION['nazwisko'],
            'description' => $_SESSION['opis'],
            'phone_number' => $_SESSION['numer_telefonu'],
            'email' => $_SESSION['email'],
            'position' => $_SESSION['stanowisko'],
            'gender' => $_SESSION['plec'],
            'age' => $_SESSION['wiek'],
            'country' => $_SESSION['kraj']
        ]]);
    } else {
        json_encode('you are not logged');
    }
?>