<?php 
 class Usuario
 {
    static function all()
    {
        $sql = "SELECT * FROM usuarios";
        $select = DB::getConn()->prepare($sql);
        $select->execute();
        $Usuarios =  $select->fetchAll();
        return $Usuarios; 
    }

    static function getUsuarioByID($id)
    {

    }

    static function setUsuario($nome, $email)
    {
        try{
            $sql = "INSERT INTO usuarios SET `nome` = ?, `email` = ?, `dt_cadastro` = NOW();";
            
            $insert = DB::getConn()->prepare($sql); 
            $insert->execute(array($nome,$email));
            return DB::getConn()->lastInsertId();
        }catch(PDOException $e){
        
            logErros($e);
            echo json_encode($e);
            return 0;
        }     
    }

 }
    