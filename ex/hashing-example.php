<?php

$password = 'bbbb';

$hash = password_hash($password, PASSWORD_DEFAULT);

echo $hash;

//$hash = '$2y$10$oB4moe9GzMBDu/ZDJMWryOltOq.rNydANfFFRRn4Ti2Aovx05hiqy';

//var_dump(password_verify($password, $hash));



//$password = '123456';
//$hash = '$2y$10$oB4moe9GzMBDu/ZDJMWryOltOq.rNydANfFFRRn4Ti2Aovx05hiqy';

//$password = 'bbbb';
//$hash = '$2y$10$SaqsLU3G/CieKh7YtfMrH.JV3Dy4LGYlsupvDfjHs0z1GP.HjoxE2';