<?php 
 class Estado
 {
    static function all()
    {
        $sql = "SELECT * FROM estados";
        $select = DB::getConn()->prepare($sql);
        $select->execute();
        $estados =  $select->fetchAll();
        return $estados; 
    }

    static function getEstadoByID($id)
    {

    }

    static function getEstadoByUf($uf)
    {

    }

 }
    