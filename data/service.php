<?php

class Service
{
    public $serviceId;
    public $serviceName;
    public $serviceAddress;
    public $servicePhone;

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
        $query = "SELECT * FROM " . $this->table . " s WHERE s.serviceId = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->serviceId);

        $stmt->execute();

        $service = $stmt->fetch(PDO::FETCH_ASSOC);

        $this->serviceId = $service['serviceId'];
        $this->serviceName = $service['serviceName'];
        $this->serviceAddress = $service['serviceAddress'];
        $this->servicePhone = $service['servicePhone'];
    }

    function add()
    {
        $query = "INSERT INTO " . $this->table . " SET serviceId=:serviceId, serviceName=:serviceName, serviceAddress=:serviceAddress, servicePhone=:servicePhone";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam('serviceId', $this->serviceId);
        $stmt->bindParam('serviceName', $this->serviceName);
        $stmt->bindParam('serviceAddress', $this->serviceAddress);
        $stmt->bindParam('servicePhone', $this->servicePhone);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function update()
    {
        $query = "UPDATE " . $this->table . " SET serviceName=:serviceName, serviceAddress=:serviceAddress, servicePhone=:servicePhone WHERE serviceId=:serviceId";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam('serviceId', $this->serviceId);
        $stmt->bindParam('serviceName', $this->serviceName);
        $stmt->bindParam('serviceAddress', $this->serviceAddress);
        $stmt->bindParam('servicePhone', $this->servicePhone);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function delete()
    {
        $query = "DELETE FROM " . $this->table . " WHERE serviceId=?";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->serviceId);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
}