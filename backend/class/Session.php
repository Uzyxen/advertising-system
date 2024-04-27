<?php
    class Session {
        public function __construct()
        {
            if(session_status() == PHP_SESSION_NONE) { // if session doesnt exists
                session_start();

                $this->saveSessionCookie();
            }
        }

        public function regenerateID() {
            session_regenerate_id(true);

            $this->saveSessionCookie();
        }

        private function saveSessionCookie() {
            setcookie('PHPSESSID', session_id(), time() + 20 * 24 * 60 * 60, '/', '', false, true); // 20 days
        }

        public function exists() {
            if(session_status() == PHP_SESSION_ACTIVE) {
                return true;
            }

            return false;
        }

        public function set($key, $value) {
            $_SESSION[$key] = $value;
        }

        public function has($key) {
            return array_key_exists($key, $_SESSION);
        }

        public function get($key) {
            if (array_key_exists($key, $_SESSION)) {
                return $_SESSION[$key];
            }

            return null;
        }
    }
?>