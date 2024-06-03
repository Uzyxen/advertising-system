<?php
    require_once(__DIR__ . '/../class/Companies.php');

    class CompaniesController extends Companies {
        private $company_id;

        public function __construct($company_id)
        {
            $this->company_id = $company_id;
        }

        public function fetchCompanyData() {
            return $this->getCompany($this->company_id);
        }

        public function fetchCompanyOfferQuantity() {
            return $this->getCompanyOfferQuantity($this->company_id);
        }

        public function fetchCompanyTechnologies() {
            return $this->getCompanyTechnologies($this->company_id);
        }

        public function fetchCompanyOffers() {
            return $this->getCompanyOffers($this->company_id);
        }

        public function fetchRecomendedCompanies() {
            return $this->getRecomendedCompanies();
        }
    }
?>