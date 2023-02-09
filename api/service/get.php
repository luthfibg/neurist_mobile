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
$service->serviceId = isset($_GET['serviceId']) ? $_GET['serviceId'] : die();

$service->get();

$response = [];

if ($request == 'GET') {
    if ($service->serviceId != null) {
        $data = array(
            'serviceId' => $service->serviceId,
            'serviceName' => $service->serviceName,
            'serviceAddress' => $service->serviceAddress,
            'servicePhone' => $service->servicePhone,
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