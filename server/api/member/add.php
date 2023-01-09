<?php

header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: X-Requested-With');
header("Content-Type: application/json; charset=UTF-8");

include_once "../../config/database.php";
include_once "../../data/member.php";

$request = $_SERVER['REQUEST_METHOD'];

$db = new Database();
$conn = $db->connection();

$member = new Member($conn);
$data = json_decode(file_get_contents("php://input"));

$response = [];

if ($request == 'POST') {
    if (
        !empty($data->id) &&
        !empty($data->name) &&
        !empty($data->age) &&
        !empty($data->address) &&
        !empty($data->service_id) &&
        !empty($data->phone) &&
        !empty($data->email)
    ) {
        $member->id = $data->id;
        $member->name = $data->name;
        $member->age = $data->age;
        $member->address = $data->address;
        $member->service_id = $data->service_id;
        $member->phone = $data->phone;
        $member->email = $data->email;

        $data = array(
            'id' => $member->id,
            'name' => $member->name,
            'age' => $member->age,
            'address' => $member->address,
            'service_id' => $member->service_id,
            'phone' => $member->phone,
            'email' => $member->email,
        );

        if ($member->add()) {
            $response = array(
                'status' => array(
                    'message' => 'success', 'code' => (http_response_code(200))
                ), 'data' => $data
            );
        } else {
            http_response_code(400);
            $response = array(
                'message' => 'add failed',
                'code' => http_response_code()
            );
        }
    } else {
        http_response_code(400);
        $response = array(
            'status' => array(
                'message' => 'add failed - wrong parameter', 'code' => http_response_code()
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