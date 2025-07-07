<?php
    session_start();
    require_once("../config/database.php");
    $db= new Database;
    $con = $db ->conectar();
    $email= $_SESSION['email'];
    $sql = $con->prepare("SELECT * FROM user INNER JOIN tip_user ON user.tip_user_u = tip_user.id_tip_user WHERE user.email = '$email'");
    $sql->execute();
    $fila = $sql->fetch();
?>
<?php
if(isset($_POST['cerrar-sesion'])){
    session_destroy();
    header('location: ../index.php');
}
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="">
    </head>
    <body>
        <h1> Bienvenido Señ@r <?php echo $fila['nombres']." Su rol es: ".$fila['tip_user'] ?> </h1>
        <form method="POST">
            <input type="submit" value="Cerrar Sesion" name="cerrar-sesion">
        </form>
    </body>
</html> 