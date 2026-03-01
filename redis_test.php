<?php

$redis = new Redis();
$redis->connect('redis', 6379);
$count = $redis->incr('hits');
echo "Вы посетили эту страницу $count раз";