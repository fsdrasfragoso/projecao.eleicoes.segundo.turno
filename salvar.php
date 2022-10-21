<?php
include('class/DB.class.php');
include('class/Usuario.class.php');
include('class/Projecao.class.php');
include('class/Estado.class.php');
include('class/Candidato.class.php');

extract($_POST);

$usuario_id = Usuario::setUsuario($nome,$email);
foreach(Estado::all() as $estado)
{
    foreach(Candidato::all() as $candidato)
    {
        $analise = Projecao::setProjecao($projecao[$estado['id']][$candidato['id']],$estado['id'],$candidato['id'],$usuario_id);
    }
}







?>