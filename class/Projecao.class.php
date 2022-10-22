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

        try{
            $sql = "SELECT
                        e.bandeira,
                        e.Estado,
                        c.sigla AS partido,
                        c.Apelido AS candidato,
                        c.numero,
                        e.UF,
                        FLOOR(
                            (
                                (e.votos_validos / 100) * p.porcentagem
                            )
                        ) AS mum_votos,
                        CONCAT(p.porcentagem, '%') AS porcentagem
                    FROM
                        projecoes AS p
                    INNER JOIN estados AS e ON e.id = p.estados_id
                    INNER JOIN candidatos AS c ON c.id = p.candidatos_id
                    WHERE
                        p.usuario_id = ?
                    ORDER BY
                        e.Estado ASC,
                        c.id ASC;";
            
            $select = DB::getConn()->prepare($sql);
            $select->execute(array($id));
            $projecao =  $select->fetchAll();
            return $projecao;   
        }catch(PDOException $e){
        
            logErros($e);
            echo json_encode($e);
            return 0;
        }   

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
    