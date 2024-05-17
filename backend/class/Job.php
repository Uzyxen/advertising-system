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
    }
?>