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

        $product = $stmt->fetch(PDO::FETCH_ASSOC);

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
        
    }

    function update()
    {

    }

    function delete()
    {
        
    }
}
