<?php

header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: X-Requested-With');
header("Content-Type: application/json; charset=UTF-8");

include_once "../../config/database.php";
include_once "../../data/service.php";

$request = $_SERVER['REQUEST_METHOD'];

$db = new Database();
$conn = $db->connection();

$service = new Service($conn);
$data = json_decode(file_get_contents("php://input"));

$response = [];

if ($request == 'POST') {
    if (
        !empty($data->service_id) &&
        !empty($data->service_name) &&
        !empty($data->service_address) &&
        !empty($data->service_phone)
    ) {
        $service->service_id = $data->service_id;
        $service->service_name = $data->service_name;
        $service->service_address = $data->service_address;
        $service->service_phone = $data->service_phone;

        $data = array(
            'service_id' => $service->service_id,
            'service_name' => $service->service_name,
            'service_address' => $service->service_address,
            'service_phone' => $service->service_phone,
        );

        if ($service->add()) {
            $response = array(
                'status' => array(
                    'message' => 'success', 'code' => (http_response_code(200))
                ), 'data' => $data
            );
        } else {
            http_response_code(400);
            $response = array(
                'message' => 'add service failed',
                'code' => http_response_code()
            );
        }
    } else {
        http_response_code(400);
        $response = array(
            'status' => array(
                'message' => 'add failed - wrong parameter to service', 'code' => http_response_code()
            )
        );
    }
} else {
    http_response_code(405);
    $response = array(
        'status' => array(
            'message' => 'service method not allowed', 'code' => http_response_code()
        )
    );
}

echo json_encode($response);