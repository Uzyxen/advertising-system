<?php
    require_once(__DIR__ . '/../class/Search.php');

    class SearchController extends Search {
        private $value;

        public function __construct($value)
        {
            $this->value = $value;
        }

        public function fetchOffers() {
            return $this->getOffers($this->value);
        }
    }
?>