<?php

header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: DELETE');
header('Access-Control-Allow-Headers: X-Requested-With');
header("Content-Type: application/json; charset=UTF-8");

include_once "../../config/database.php";
include_once "../../data/device.php";

$request = $_SERVER['REQUEST_METHOD'];

$db = new Database();
$conn = $db->connection();

$device = new Device($conn);
$data = json_decode(file_get_contents("php://input"));
$device->id = $data->id;

$response = [];

if ($request == 'DELETE') {
    if (
        !empty($data->id)
    ) {
        $device->id = $data->id;

        if ($device->delete()) {
            $response = array(
                'status' => array(
                    'message' => 'success', 'code' => (http_response_code(200))
                )
            );
        } else {
            http_response_code(400);
            $response = array(
                'message' => 'delete failed',
                'code' => http_response_code()
            );
        }
    } else {
        http_response_code(400);
        $response = array(
            'status' => array(
                'message' => 'delete failed - wrong parameter',
                'code' => http_response_code()
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