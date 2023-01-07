<?php

class Database
{
    private $host = 'localhost';
    private $dbname = 'neurist';
    private $username = 'root';
    private $password = 'mluthfi@MySQLU';
    public $conn;

    public function connection()
    {
        $this->conn = null;
        try {
            //code...
        } catch (\Throwable $th) {
            //throw $th;
        }

        return $this->conn;
    }
}