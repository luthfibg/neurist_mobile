<?php

header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: X-Requested-With');
header("Content-Type: application/json; charset=UTF-8");

include_once "../../config/database.php";
include_once "../../data/service.php";

$request = $_SERVER['REQUEST_METHOD'];

$db = new Database();
$conn = $db->connection();

$service = new Service($conn);
$service->service_id = isset($_GET['service_id']) ? $_GET['service_id'] : die();

$service->get();

$response = [];

if ($request == 'GET') {
    if ($service->service_id != null) {
        $data = array(
            'service_id' => $service->service_id,
            'service_name' => $service->service_name,
            'service_address' => $service->service_address,
            'service_phone' => $service->service_phone,
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
