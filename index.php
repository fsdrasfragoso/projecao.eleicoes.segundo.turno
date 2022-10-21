<?php
  include('class/DB.class.php');

  $sql = "SHOW TABLES"; 

$select = DB::getConn()->prepare($sql); 
$select->execute();

$resgistros = $select->fetchAll();
print_r($resgistros);
?>