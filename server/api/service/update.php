<?php

header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: PUT');
header('Access-Control-Allow-Headers: X-Requested-With');
header("Content-Type: application/json; charset=UTF-8");

include_once "../../config/database.php";
include_once "../../data/service.php";

$request = $_SERVER['REQUEST_METHOD'];

$db = new Database();
$conn = $db->connection();

$service = new Service($conn);

$data = json_decode(file_get_contents("php://input"));
$service->id = $data->id;

$response = [];