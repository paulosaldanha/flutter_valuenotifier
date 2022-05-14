import 'package:flutter/material.dart';

 //Alert Dialog com botao cancelar e confirmar
 // retorna uma future do tipo inteiro, onde 0 = cancelar e 1 = confirmar
 Future<int> showAlertConfirm(BuildContext context,String msg,String title) async {

   Widget cancelaButton = TextButton(
    child: const Text("Cancelar"),
    onPressed:  () { 
      Navigator.pop(context,0);
    },
  );
  Widget continuaButton = TextButton(
    child: const Text("Confirmar"),
    onPressed:  () {
      //Navigator.pop(context,1);
      Navigator.of(context).pop(1);
    },
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(msg),
    actions: [
      cancelaButton,
      continuaButton,
    ],
  );
  //exibe o diálogo. Await para pegar a ação
  int r = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
  //retorna 0 ou 1
  return r;
}