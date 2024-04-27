<?php
    class Response {
        public function getResponse($status, $message = '') {
            return array(
                'status' => $status,
                'message' => $message
            );
        }
    }

?>