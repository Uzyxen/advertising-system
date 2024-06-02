<?php
    include('Database.php');

    class Company extends Database {
        protected function updateBasicData($name, $email, $country, $nip, $remote, $company_id) {
            $sql = "UPDATE companies SET nazwa_firmy = ?, email = ?, country = ?, NIP = ?, remote = ? WHERE company_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            if($stmt->execute([$name, $email, $country, $nip, $remote, $company_id])) {
                return true;
            }

            return false;
        }

        protected function updateDescription($description, $company_id) {
            $sql = "UPDATE companies SET description = ? WHERE company_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            if($stmt->execute([$description, $company_id])) {
                return $description;
            }

            return false;
        }

        protected function setImage($image, $company_id) {
            $sql = "UPDATE companies SET zdjecie_url = ? WHERE company_id = ?"; 
            $stmt = $this->connect()->prepare($sql);

            $uploadDirectory = __DIR__ . '/../../public/company/';
            $uploadFile = $uploadDirectory . basename($image['name']);

            if (!is_dir($uploadDirectory)) {
                mkdir($uploadDirectory, 0777, true);
            }

            if (move_uploaded_file($image['tmp_name'], $uploadFile)) { 
                $fileName = basename($image['name']);

                if($stmt->execute([$fileName, $company_id])) {
                    return true;
                } else {
                    return false;
                }
            }
        }

        protected function getCompanyData($company_id) {
            $sql = "SELECT companies.*, COUNT(ogloszenie_id) as quantity FROM companies JOIN offers ON companies.company_id = offers.firma_id WHERE company_id = ?"; 
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