<?php

header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: PUT');
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

if ($request == 'PUT') {
    if (
        !empty($data->id) &&
        !empty($data->name) &&
        !empty($data->value) &&
        !empty($data->status)
    ) {
        $device->id = $data->id;
        $device->name = $data->name;
        $device->value = $data->value;
        $device->status = $data->status;

        $data = array(
            'id' => $device->id,
            'name' => $device->name,
            'value' => $device->value,
            'status' => $device->status,
        );

        if ($device->update()) {
            $response = array(
                'status' => array(
                    'message' => 'success', 'code' => (http_response_code(200))
                ), 'data' => $data
            );
        } else {
            http_response_code(400);
            $response = array(
                'message' => 'update failed',
                'code' => http_response_code()
            );
        }
    } else {
        http_response_code(400);
        $response = array(
            'status' => array(
                'message' => 'update failed - wrong parameter',
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