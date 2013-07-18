<?php
include 'config.php';

$sql = "select Requests.*, Users.Forename, Users.Surname, Users.ColorTag from Requests LEFT JOIN Users On Requests.UserID=Users.UserID where status = :status ";

try {
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $dbh->prepare($sql);  
	$stmt->bindParam("status", $_GET[status]);
	$stmt->execute();
	$users = $stmt->fetchAll();  
	$dbh = null;
	//echo json_encode($user); 
	encodeCallback($users);
} catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}'; 
}




function encodeCallback($user) {
    header("content-type:application/json");
    if ($_GET['callback']) {
        print $_GET['callback']."(";
    }
    print json_encode($user);
    if ($_GET['callback']) {
        print ")";
    }
    exit; 
}


?> 