<?php
    require_once(__DIR__ . '/../class/Job.php');

    class JobController extends Job {
        public function fetchJobLevels() {
            return $this->getJobLevels();
        }

        public function fetchJobContractTypes() {
            return $this->getJobContractTypes();
        }

        public function fetchJobCategories() {
            return $this->getJobCategories();
        }

        public function fetchJobModes() {
            return $this->getJobModes();
        }

        public function fetchEmploymentTypes() {
            return $this->getEmploymentTypes();
        }
    }
?>