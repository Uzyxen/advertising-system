<?php
    include('Database.php');

    class Job extends Database {
        protected function getJobLevels() {
            $sql = "SELECT * FROM job_levels";
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute();

            $result = $stmt->fetchAll();

            if($result) {
                return $result;
            }
        }

        protected function getJobContractTypes() {
            $sql = "SELECT * FROM types_of_contract";
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute();

            $result = $stmt->fetchAll();

            if($result) {
                return $result;
            }
        }

        protected function getJobCategories() {
            $sql = "SELECT * FROM kategorie";
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute();

            $result = $stmt->fetchAll();

            if($result) {
                return $result;
            }
        }
    }
?>