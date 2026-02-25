<?php
$host = getenv('DB_HOST');
$db   = getenv('DB_NAME');
$user = getenv('DB_USER');
$pass = getenv('DB_PASSWORD');

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    echo "Бинго! База подключена.";
} catch (PDOException $e) {
    echo "Ошибка подключения: " . $e->getMessage();
}
