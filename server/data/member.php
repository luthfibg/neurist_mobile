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

    }

    function get()
    {

    }

    function add()
    {

    }

    function update()
    {

    }

    function delete()
    {
        
    }
}
