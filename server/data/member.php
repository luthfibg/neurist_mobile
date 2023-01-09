<?php

class Member
{
    public $id;
    public $name;
    public $age;
    public $address;
    public $service_id;
    public $phone;
    public $email;

    private $conn;
    private $table = 'members';

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
        $query = "SELECT * FROM " . $this->table . " m WHERE m.id = ? LIMIT 0,1";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);

        $stmt->execute();

        $member = $stmt->fetch(PDO::FETCH_ASSOC);

        $this->id = $member['id'];
        $this->name = $member['name'];
        $this->age = $member['age'];
        $this->address = $member['address'];
        $this->service_id = $member['service_id'];
        $this->phone = $member['phone'];
        $this->email = $member['email'];
    }

    function add()
    {
        $query = "INSERT INTO " . $this->table . " SET id=:id, name=:name, age=:age, address=:address, service_id=:service_id, phone=:phone, email=:email";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam('id', $this->id);
        $stmt->bindParam('name', $this->name);
        $stmt->bindParam('age', $this->age);
        $stmt->bindParam('address', $this->address);
        $stmt->bindParam('service_id', $this->service_id);
        $stmt->bindParam('phone', $this->phone);
        $stmt->bindParam('email', $this->email);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function update()
    {
        $query = "UPDATE " . $this->table . " SET name=:name, age=:age, address=:address, service_id=:service_id, phone=:phone, email=:email WHERE id=:id";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam('id', $this->id);
        $stmt->bindParam('name', $this->name);
        $stmt->bindParam('age', $this->age);
        $stmt->bindParam('address', $this->address);
        $stmt->bindParam('service_id', $this->service_id);
        $stmt->bindParam('phone', $this->phone);
        $stmt->bindParam('email', $this->email);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function delete()
    {
        $query = "DELETE FROM " . $this->table . " WHERE id=?";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(1, $this->id);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }
}
