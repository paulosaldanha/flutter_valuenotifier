import 'package:flutter/material.dart';

class ListaWidget extends StatelessWidget {
  final String? title;
  final VoidCallback removeClicked;
  final VoidCallback updateClicked;
  // recebe um objeto, uma ação para quando clicar em remover e atualizar
  const ListaWidget(
      {Key? key, this.title, required this.removeClicked, required this.updateClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
   // return Observer(
    //  builder: (_) {
        return Row(
          children: <Widget>[
            Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(title!),
                )),
            Expanded(
              flex: 2,
              child: IconButton(
                alignment: Alignment.topRight,
                tooltip: "Atualiza",
                icon: const Icon(Icons.edit),
                onPressed: updateClicked,
              ),
            ),
            Expanded(
              flex: 2,
              child: IconButton(
                color: Colors.red,
                alignment: Alignment.topRight,
                tooltip: "Deleta",
                icon: const Icon(Icons.delete),
                onPressed: removeClicked,
              ),
            ),
          ],
        );
     // },
   // );
  }
}