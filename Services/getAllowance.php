<?php
include 'config.php';

$sql = "select * from Leaves where UserID = :id";

try {
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $dbh->prepare($sql);  
	$stmt->bindParam("id", $_GET[id]);
	$stmt->execute();
	$user = $stmt->fetchObject();  
	$dbh = null;
	//echo json_encode($user); 
	encodeCallback($user);
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