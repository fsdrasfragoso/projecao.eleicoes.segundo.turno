<?php
include('class/DB.class.php');
include('class/Estado.class.php');
include('class/Candidato.class.php');
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
      </li>
    </ul>

  </div>
</nav>
<br/> <br/>
    <main role="main">        
            <form action="salvar.php" method="POST">
            <div class="card border">
                    <div class="card-body"> 
            <div class="form-group">
                <label for="nome">Seu Nome</label>
                <input type="text" class="form-control" name="nome" 
                       id="nome" placeholder="nome">
            </div>
            <div class="form-group">
                <label for="email">Seu email</label>
                <input type="text" class="form-control" name="email" 
                       id="email" placeholder="email">
            </div>
                    </div>
                </div>
                <br/> <br/>
            <?php foreach(Estado::all() as $estado):?>
                <div class="card border">
                    <div class="card-body">  
                    <h5><img height="50px" src="/imagens/<?=$estado['bandeira']?>"/> <?=$estado['Estado']?> - <?=$estado['UF']?>: </h5> 
                        <?php foreach(Candidato::all() as $candidato):?>
                
                       
                        <div class="form-group">
                            <label for="estado_<?=$estado['id']?><?=$candidato['id']?>"> <?=$candidato['Apelido']?></label>
                            <input type="number" class="form-control" value="50" min="1" max="99"
                                        id="estado_<?=$estado['id']?><?=$candidato['id']?>" name="projecao[<?=$estado['id']?>][<?=$candidato['id']?>]" >
                        </div>
                       
                        <?php endforeach;?>
                        </div>
            </div> <br/> <br/>
                     <?php endforeach; ?>
                    
                    <button type="submit" class="btn btn-primary btn-sm">Salvar</button>
                    <button type="cancel" class="btn btn-danger btn-sm">Cancel</button>               
            </form> 
        <main role="main">
    </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
        <script>
            <?php foreach(Estado::all() as $estado):?>
                <?php foreach(Candidato::all() as $candidato):?>
                    $("#estado_<?=$estado['id']?><?=$candidato['id']?>").on("input", function(){
                        if($("#estado_<?=$estado['id']?><?=$candidato['id']?>").val() > 99)
                        {
                            $("#estado_<?=$estado['id']?><?=$candidato['id']?>").val(99);
                        }

                        if($("#estado_<?=$estado['id']?><?=$candidato['id']?>").val() < 0)
                        {
                            $("#estado_<?=$estado['id']?><?=$candidato['id']?>").val(1);
                        }

                        <?php if($candidato['Apelido'] == 'Lula'):?> 
                             valor = 100 - $("#estado_<?=$estado['id']?><?=$candidato['id']?>").val();
                             $("#estado_<?=$estado['id']?>2").val(valor);
                        <?php endif;?>
                        <?php if($candidato['Apelido'] == 'Bolsonaro'):?> 
                             valor = 100 - $("#estado_<?=$estado['id']?><?=$candidato['id']?>").val();
                             $("#estado_<?=$estado['id']?>1").val(valor);
                        <?php endif;?>
                    });
       
                <?php endforeach;?> 
            <?php endforeach;?>
        </script>
    </body>
</html>
   