<?php

header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: X-Requested-With');
header("Content-Type: application/json; charset=UTF-8");

include_once "../../config/database.php";
include_once "../../data/device.php";

$request = $_SERVER['REQUEST_METHOD'];

$db = new Database();
$conn = $db->connection();

$device = new Device($conn);
$device->id = isset($_GET['id']) ? $_GET['id'] : die();

$device->get();

$response = [];

if ($request == 'GET') {
    if ($device->id != null) {
        $data = array(
            'id' => $device->id,
            'name' => $device->name,
            'value' => $device->value,
            'status' => $device->status,
        );
        $response = array(
            'status' => array(
                'message' => 'success', 'code' => (http_response_code(200))
            ), 'data' => $data
        );
    } else {
        http_response_code(404);
        $response = array(
            'status' => array(
                'message' => 'no data found', 'code' => http_response_code()
            )
        );
    }
} else {
    http_response_code(405);
    $response = array(
        'status' => array(
            'message' => 'method not allowed', 'code' => http_response_code()
        )
    );
}

echo json_encode($response);
