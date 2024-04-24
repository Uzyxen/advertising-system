<?php
    class Database {
        private $host = 'localhost';
        private $database = 'system_ogloszeniowy';
        private $username = 'root';
        private $password = '';

        protected function connect() {
            $pdo = new PDO("mysql:host=$this->host; dbname=$this->database; charset=UTF8", $this->username, $this->password); // connection with db
            $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

            return $pdo;
        }
    }
?>