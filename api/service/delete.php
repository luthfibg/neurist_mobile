<?php

header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: DELETE');
header('Access-Control-Allow-Headers: X-Requested-With');
header("Content-Type: application/json; charset=UTF-8");

include_once "../../config/database.php";
include_once "../../data/service.php";

$request = $_SERVER['REQUEST_METHOD'];

$db = new Database();
$conn = $db->connection();

$service = new Service($conn);
$data = json_decode(file_get_contents("php://input"));
$service->service_id = $data->service_id;

$response = [];

if ($request == 'DELETE') {
    if (
        !empty($data->service_id)
    ) {
        $service->service_id = $data->service_id;

        if ($service->delete()) {
            $response = array(
                'status' => array(
                    'message' => 'delete service success', 'code' => (http_response_code(200))
                )
            );
        } else {
            http_response_code(400);
            $response = array(
                'message' => 'delete service failed',
                'code' => http_response_code()
            );
        }
    } else {
        http_response_code(400);
        $response = array(
            'status' => array(
                'message' => 'delete failed - wrong parameter to service',
                'code' => http_response_code()
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