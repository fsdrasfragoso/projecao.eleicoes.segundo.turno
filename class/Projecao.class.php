<?php 
 class Projecao
 {
    static function all()
    {
        $sql = "SELECT * FROM projecoes";
        $select = DB::getConn()->prepare($sql);
        $select->execute();
        $projeceos =  $select->fetchAll();
        return $projeceos; 
    }

    static function getProjecaoByID($id)
    {

    }

    static function setProjecao($porcentagem,$estado_id,$candidato_id,$usuario_id)
    {       
        try{
            $sql = "INSERT INTO projecoes SET `porcentagem` = ?, `estados_id` = ?, `candidatos_id` = ?, `usuario_id` = ?"; 
            $insert = DB::getConn()->prepare($sql); 
            $insert->execute(array($porcentagem,$estado_id,$candidato_id,$usuario_id));
            return DB::getConn()->lastInsertId();
        }catch(PDOException $e){
        
            logErros($e);
            echo json_encode($e);
            return 0;
        }     
    }

   

 }
    