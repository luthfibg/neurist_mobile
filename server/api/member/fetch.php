<?php

header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: X-Requested-With');
header("Content-Type: application/json; charset=UTF-8");

include_once "../../config/databse.php";
include_once "../../data/member.php";

$db = new Database();
$conn = $db->connection();

$member = new Member($conn);

$stmt = $member->fetch();
$count = $stmt->rowCount();

$response = [];