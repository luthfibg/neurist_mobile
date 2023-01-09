<?php

class Service
{
    public $service_id;
    public $service_name;
    public $service_address;
    public $service_phone;

    private $conn;
    private $table = 'services';

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    function fetch()
    {
        $query = "SELECT * FROM " . $this->table;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    function get()
    {
        $query = "SELECT * FROM " . $this->table . " s WHERE s.service_id = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->service_id);

        $stmt->execute();

        $service = $stmt->fetch(PDO::FETCH_ASSOC);

        $this->service_id = $service['service_id'];
        $this->service_name = $service['service_name'];
        $this->service_address = $service['service_address'];
        $this->service_phone = $service['service_phone'];
    }

    function add()
    {
        $query = "INSERT INTO " . $this->table . " SET service_id=:service_id, service_name=:service_name, service_address=:service_address, service_phone=:service_phone";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam('service_id', $this->service_id);
        $stmt->bindParam('service_name', $this->service_name);
        $stmt->bindParam('service_address', $this->service_address);
        $stmt->bindParam('service_phone', $this->service_phone);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function update()
    {
        $query = "UPDATE " . $this->table . " SET service_name=:service_name, service_address=:service_address, service_phone=:service_phone, WHERE service_id=:service_id";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam('service_id', $this->service_id);
        $stmt->bindParam('service_name', $this->service_name);
        $stmt->bindParam('service_address', $this->service_address);
        $stmt->bindParam('service_phone', $this->service_phone);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function delete()
    {
        $query = "DELETE FROM " . $this->table . " WHERE service_id=?";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->service_id);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
}
