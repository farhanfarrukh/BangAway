<?php
include 'config.php';

$sql = "INSERT INTO Requests (UserID, RequestType, DateFrom, DateTo, Description) VALUES (:userID, :leavetype, :dateFrom, :dateTo, :desc)";

try {
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	$stmt = $dbh->prepare($sql);  
	$stmt->execute(array(':userID'=>$_GET[userID],':leavetype'=>$_GET[leavetype],':dateFrom'=>$_GET[dateFrom],':dateTo'=>$_GET[dateTo],':desc'=>$_GET[desc]));
	$dbh = null;
	encodeCallback(); 
} catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}'; 
}




function encodeCallback() {
    header("content-type:application/json");
    if ($_GET['callback']) {
        print $_GET['callback']."(";
    }
    if ($_GET['callback']) {
        print ")";
    }
    exit; 
}


?> 