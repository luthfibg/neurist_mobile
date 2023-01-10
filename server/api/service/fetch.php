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

$stmt = $service->fetch();
$count = $stmt->rowCount();

$response = [];

if ($request == 'GET') {
    if ($count > 0) {
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            extract($row);
            $data[] = array(
                "service_id" => $service_id,
                "service_name" => $service_name,
                "service_address" => $service_address,
                "service_phone" => $service_phone,
            );
        }
        $response = array(
            'status' => array(
                'message' => 'success', 'code' => http_response_code(200)
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