<?php

header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: X-Requested-With');
header("Content-Type: application/json; charset=UTF-8");

include_once "../../config/database.php";
include_once "../../data/member.php";

$request = $_SERVER['REQUEST_METHOD'];

$db = new Database();
$conn = $db->connection();

$member = new Member($conn);
$member->id = isset($_GET['id']) ? $_GET['id'] : die();

$member->get();

$response = [];

if ($request == 'GET') {
    if ($member->id != null) {
        $data = array(
            'id' => $member->id,
            'name' => $member->name,
            'age' => $member->age,
            'address' => $member->address,
            'i' => $member->serviceid,
            'phone' => $member->phone,
            'email' => $member->email,
        );
        $response = array(
            'status' => array(
                'message' => 'success',
                'code' => (http_response_code(200))
            ),
            'data' => $data
        );
    } else {
        http_response_code(404);
        $response = array(
            'status' => array(
                'message' => 'no data found',
                'code' => http_response_code()
            )
        );
    }
} else {
    http_response_code(405);
    $response = array(
        'status' => array(
            'message' => 'method not allowed',
            'code' => http_response_code()
        )
    );
}

echo json_encode($response);