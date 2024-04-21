<?php
    $host = 'localhost';
    $database = 'system_ogloszeniowy';
    $username = 'root';
    $password = '';

    try {
        $db = new PDO("mysql:host=$host; dbname=$database; charset=UTF8", $username, $password); // connection with db
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch(PDOException $e){
        exit('Database error!');
    }
?>