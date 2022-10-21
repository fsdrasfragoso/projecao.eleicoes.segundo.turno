<?php 
 class Candidato
 {
    static function all()
    {
        $sql = "SELECT * FROM candidatos";
        $select = DB::getConn()->prepare($sql);
        $select->execute();
        $candidatos =  $select->fetchAll();
        return $candidatos; 
    }

    static function getCandidatoByID($id)
    {

    }

    static function getCandidatoByNumero($numero)
    {

    }

 }
    