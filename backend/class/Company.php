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
            $sql = "SELECT *, COUNT(ogloszenie_id) as quantity FROM companies JOIN offers ON companies.company_id = offers.firma_id WHERE company_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$company_id]);
            $result = $stmt->fetch();

            return $result;
        }

        protected function getCompanyTechnologies($company_id) {
            $sql = "SELECT technology, technology_id FROM technologies WHERE company_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            $stmt->execute([$company_id]);
            $result = $stmt->fetchAll();

            return $result;
        }

        protected function setTechnology($value, $company_id) {
            $sql = "INSERT INTO technologies (technology, company_id) VALUES (?, ?)"; 
            $stmt = $this->connect()->prepare($sql);

            if($stmt->execute([$value, $company_id])) {
                return $value;
            }

            return false;
        }

        protected function removeTechnology($id, $company_id) {
            $sql = "DELETE FROM technologies WHERE technology_id = ? AND company_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            if($stmt->execute([$id, $company_id])) {
                return $id;
            } else {
                return false;
            }
        }
    }
?>