<?php

include 'config.php';

$sql = "UPDATE Requests SET Status=? where RequestID=?";

$getRequests = "Select * from Requests where RequestID=:rid";

$getAllowance = "Select * from Leaves where UserID=:uid";

$updateAllowance = "UPDATE Leaves SET HolidayLeft=?, HolidayTaken=? where UserID=?";


try {
	$dbh = new PDO("mysql:host=$dbhost;dbname=$dbname", $dbuser, $dbpass);	
	$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	
	// Update Requests 
	$stmt = $dbh->prepare($sql);  
	$stmt->execute(array($_GET[status],$_GET[rid]));
	
	//Get Requests
	$stmt = $dbh->prepare($getRequests);
	$stmt->bindParam("rid", $_GET[rid]);  
	$stmt->execute();
	$row = $stmt->fetch();	
	$df = $row["DateFrom"];
	$dt = $row["DateTo"];	
	$weekDays = "";
	
	for($i=$df;$i<=$dt; $i+=86400){
		if(date("N",$i) != 6 && date("N",$i) != 7)
		{
			$weekDays += 1;
		}
	}
	
	
	//Get Allowance
	$stmt = $dbh->prepare($getAllowance); 
	$stmt->bindParam("uid", $_GET[uid]);   
	$stmt->execute();
	$row = $stmt->fetch();
	$taken = $row["HolidayTaken"]+$weekDays;
	$left = $row["HolidayLeft"]-$weekDays;

	//Update Allowance
	$stmt = $dbh->prepare($updateAllowance);  
	$stmt->execute(array($left,$taken,$_GET[uid]));
	$dbh = null;	
	
	encodeCallback(); 
} catch(PDOException $e) {
	echo '{"error":{"text":'. $e->getMessage() .'}}'; 
}




function encodeCallback() {
  //  header("content-type:application/json");
    if ($_GET['callback']) {
        print $_GET['callback']."(";
    }
    if ($_GET['callback']) {
        print ")";
    }
    exit; 
}


?> 