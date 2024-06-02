<?php
    class Database {
        private $pdo;

        protected function connect() {
            if($this->pdo == null) {
                try {
                    $host = 'localhost';
                    $database = 'advertising_system';
                    $username = 'root';
                    $password = '';
    
                    $this->pdo = new PDO("mysql:host=$host; dbname=$database; charset=UTF8", $username, $password); // connection with db
                    $this->pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
                } 
                catch (PDOException $e) {
                    print "Error: " . $e->getMessage() . "<br />";
                    die();
                }
            }

            return $this->pdo;
        }
    }
?>