<?php
include('class/DB.class.php');
include('class/Usuario.class.php');
?>

<!DOCTYPE html>

<html lang="pt-br">

    <head>
     
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <style>      
            body {
                    padding-top: 54px;
                 }
            @media (min-width: 992px) 
            {
                body{
                        padding-top: 56px;
                    }
            }
        </style>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>  Projeções </title>  
    </head>

    <body>
    <div class="container">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark rounded">
  <button class="navbar-toggler" type="button" data-toggle="collapse" 
          data-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbar">
    <ul class="navbar-nav mr-auto">
      <li @if($current=="home") class="nav-item active" @else class="nav-item" @endif>
        <a class="nav-link" href="/">Home </a>
        <a class="nav-link" href="/projecoes.php">Projeções </a>
      </li>
    </ul>

  </div>
</nav>
<br/> <br/>
    <main role="main">  
    
        <div class="card border">
            <div class="card-body">
                <h5 class="card-title">Projeções</h5>
                <table class="table table-ordered table-hover" id="status">
                    <thead>
                        <tr>
                            <th>Analista</th>
                            <th>Ação</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach(Usuario::all() as $usuario): ?>
                            <tr>
                                <td><?=$usuario['nome']?></td>
                                <td><a href="/projecao.php?usuario_id=<?=$usuario['id']?>"> Acessar Analise </a></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
            <div class="card-footer">
                <a href="/" class="btn btn-sm btn-primary" role="button">Nova Projeção</a>                
            </div>
        </div>
            
    <main role="main">
    </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
        
    </body>
</html>