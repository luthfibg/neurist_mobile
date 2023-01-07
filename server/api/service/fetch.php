<?php

header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: X-Requested-With');
header("Content-Type: application/json; charset=UTF-8");

include_once "../../config/databse.php";
include_once "../../data/service.php";

$db = new Database();
$conn = $db->connection();

$service = new Service($conn);

$stmt = $service->fetch();
$count = $stmt->rowCount();

$response = [];