<?php
    include('Database.php');

    class Company extends Database {
        protected function updateDescription($description, $company_id) {
            $sql = "UPDATE companies SET description = ? WHERE company_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            if($stmt->execute([$description, $company_id])) {
                return $description;
            }

            return false;
        }

        protected function getCompanyData($company_id) {
            $sql = "SELECT * FROM companies WHERE company_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$company_id]);
            $result = $stmt->fetch();

            return $result;
        }
    }
?>