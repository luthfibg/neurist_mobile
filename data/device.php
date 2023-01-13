<?php

class Device
{
    public $id;
    public $name;
    public $value;
    public $status;

    private $conn;
    private $table = 'devices';

    function __construct($conn)
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

        $device = $stmt->fetch(PDO::FETCH_ASSOC);

        $this->id = $device['id'];
        $this->name = $device['name'];
        $this->value = $device['value'];
        $this->status = $device['status'];
    }

    function add()
    {
        $query = "INSERT INTO " . $this->table . " SET id=:id, name=:name, value=:value, status=:status";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam('id', $this->id);
        $stmt->bindParam('name', $this->name);
        $stmt->bindParam('value', $this->value);
        $stmt->bindParam('status', $this->status);

        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function update()
    {
        $query = "UPDATE " . $this->table . " SET name=:name, value=:value, status=:status WHERE id=:id";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam('id', $this->id);
        $stmt->bindParam('name', $this->name);
        $stmt->bindParam('value', $this->value);
        $stmt->bindParam('status', $this->status);

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
