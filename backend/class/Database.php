<?php
    class Database {
        protected function connect() {
            try {
                $host = 'localhost';
                $database = 'advertising_system';
                $username = 'root';
                $password = '';

                $pdo = new PDO("mysql:host=$host; dbname=$database; charset=UTF8", $username, $password); // connection with db
                $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
             
                return $pdo;
            } 
            catch (PDOException $e) {
                print "Error: " . $e->getMessage() . "<br />";
                die();
            }
        }
    }
?>