<?php

class Database{
    private $hostname="dallal-cvc2q1";
    private $username="rootuser";
    private $password="CDxLH7YxFdGx0yQ4JXPB1yduYhEuRB4Y@";
    private $database="dallal";
    private $database_connection;
 public function connect(){
   mysqli_report(MYSQLI_REPORT_OFF);
   
    $this->database_connection= mysqli_connect(
        $this->hostname,
        $this->username,
        $this->password,
        $this->database
    );

    if(!$this->database_connection){
       return "Connection failed: ".mysqli_connect_error();
    }
    
    mysqli_set_charset($this->database_connection, "utf8mb4");
    $this->database_connection->query("SET NAMES utf8mb4");
    $this->database_connection->query("SET CHARACTER SET utf8mb4");

    return $this->database_connection;
 }
 public function close(){
    mysqli_close($this->database_connection);
 }


}











