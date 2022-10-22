<?php
include('class/DB.class.php');
include('class/Projecao.class.php');
extract($_GET);
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
    
        <div class="card border">
            <div class="card-body">
                <h5 class="card-title">Projeções</h5>
                <table class="table table-ordered table-hover" id="status">
                    <thead>
                        <tr>
                            <th>Bandeira</th>
                            <th>Estado</th>
                            <th>UF</th>
                            <th>candidato</th>
                            <th>numero</th>
                            <th>partido</th>                            
                            <th>Numero de Votos</th>
                            <th>porcentagem</th>
                        </tr>
                    </thead>
                    <tbody>
                    <?php $total = array();
                          $total['Lula']['PT'] = 0;
                          $total['Bolsonaro']['PL'] = 0;
                          $soma = 0; 
                     ?>
                        <?php foreach(Projecao::getProjecaoByID($usuario_id) as $projecao): ?>
                            <tr>
                                <td><img src="/imagens/<?=$projecao['bandeira']?>" height="50px"/></td>
                                <td><?=$projecao['Estado']?></td>
                                <td><?=$projecao['UF']?></td>
                                <td><?=$projecao['candidato']?></td>
                                <td><?=$projecao['numero']?></td>
                                <td><?=$projecao['partido']?></td>
                                <td><?=$projecao['mum_votos']?></td>
                                <td><?=$projecao['porcentagem']?></td>
                            </tr>
                            <?php 
                                $total[$projecao['candidato']][$projecao['partido']] += $projecao['mum_votos'];
                                $soma +=  $projecao['mum_votos']; 
                            ?>
                        <?php endforeach;?> 
                        <?php foreach($total as $key => $t):?>
                        <?php foreach($t as $k => $v):?>    
                            <tr>
                            <td><img src="/imagens/01-brasil-circle.png" height="50px"/></td>
                            <td>BRASIL</td>
                            <td>BR</td>
                            <td><?=$key?></td>
                            <td>numero</td>
                            <td><?=$k?></td>                            
                            <td><?=$v?></td>
                            <td><?= (($v/$soma)*100) ?>%</td>
                            </tr> 
                        <?php endforeach;?>
                        <?php endforeach;?>    
                    </tbody>
                </table>
            </div>
            <div class="card-footer">
                <a href="/" class="btn btn-sm btn-primary" role="button">Nova Projeção</a>
                <a href="#" onclick="ExportToExcelStatus()" data-pjax class="btn btn-secondary">Download</a>
            </div>
        </div>
            
    <main role="main">
    </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> 
        <script type="text/javascript" src="https://unpkg.com/xlsx@0.15.1/dist/xlsx.full.min.js"></script>
        <script>
            function ExportToExcelStatus(type, fn, dl) 
            {
                var elt = document.getElementById('status');
                var wb = XLSX.utils.table_to_book(elt, { sheet: "sheet1" });
                return dl ?
                XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }) :
                XLSX.writeFile(wb, fn || ('Download.' + (type || 'xlsx')));
            }
        </script> 
    </body>
</html>


