import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UIresponses{
  sucess(msg){
    Get.rawSnackbar(message: msg,backgroundColor: Colors.green);

  }
  fail(msg){
    Get.rawSnackbar(message: msg??"Falha ao Entrar",backgroundColor: Colors.red);

  }

  internetFail() {
    Get.rawSnackbar(message: "Verifique a sua conexão com a internet",backgroundColor: Colors.red,mainButton: TextButton(child: Text("Recarregar"),onPressed: (){Navigator.pop(Get.context!);},) );

  }
pop(){

    Navigator.pop(Get.context!);
}

}