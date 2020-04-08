<?php

  require '../../configuration.php';

  $credential = array('STATUS' => "EMAIL_AND_PASSWORD_NOT_VALID", 
                      'USER_BALANCE' => "ERROR",
                      'USER_NAME' =>"ERROR");

  if($_GET['email_user'] && $_GET['pass_user']){
      $email_user = $_GET['email_user'];
      $pass_user = $_GET['pass_user'];

      $data = $dale->kueri("SELECT * FROM `user` WHERE `email_user` =  '".$email_user."' AND `pass_user` = '".$pass_user."'");

      $data = json_decode($data);

      if(sizeof($data) == 0){
          echo $credential;
      }

      else{
        $credential = array('STATUS' => "EMAIL_AND_PASSWORD_VALID", 
                            'USER_BALANCE' => $data[0]->balance_user,
                            'USER_NAME' => $data[0]->name_user);
      }

      echo json_encode($credential);
  }
  else{
      echo $credential;
  }

?>