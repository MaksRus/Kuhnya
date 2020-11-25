<?php

namespace App\Helpers;

class Recaptcha {

    private $secret;

    public function __construct($secretCode){
        $this->secret = $secretCode;
    }


    public function checkCode($code): bool{

        if(empty($code)){
            return false;
        }

        $url = "https://www.google.com/recaptcha/api/siteverify?secret={$this->secret}&response={$code}";

        if(function_exists("curl_version")){
            $curl = curl_init($url);
            curl_setopt($curl, CURLOPT_HEADER, false);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($curl, CURLOPT_TIMEOUT, 1);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
            $response = curl_exec($curl);
        } else {
            $response = file_get_contents($url);
        }

        if(empty($response) || is_null($response)){
            return false;
        }

        $json = json_decode($response);
        return $json->success;
    }

}