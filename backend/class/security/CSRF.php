<?php
    class CSRF {
        public static function generate() {
            return md5(uniqid(mt_rand(), true)); // generate CSRF token
        }
    }
?>