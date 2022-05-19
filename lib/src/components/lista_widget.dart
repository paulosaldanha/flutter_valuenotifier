import 'package:flutter/material.dart';

class ListaWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Color? color;
  final VoidCallback removeClicked;
  final VoidCallback updateClicked;
  // recebe um objeto, uma ação para quando clicar em remover e atualizar
  const ListaWidget(
      {Key? key, this.title, this.subtitle, this.color, required this.removeClicked, required this.updateClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
   // return Observer(
    //  builder: (_) {
        return Ink(
          color: color,
          child: Row(
            children: <Widget>[ 
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 7.0, bottom: 2.0),
                    child: Text(
                      title!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, top:1.0, bottom: 7.0),
                    child: Text(
                      subtitle!,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 15),
              Expanded(
                flex: 1,
                child: IconButton(
                  alignment: Alignment.topRight,
                  tooltip: "Atualiza",
                  icon: const Icon(Icons.edit),
                  onPressed: updateClicked,
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  color: Colors.red,
                  alignment: Alignment.topRight,
                  tooltip: "Deleta",
                  icon: const Icon(Icons.delete),
                  onPressed: removeClicked,
                ),
                ),
              ),
            ],
          ),
        );
     // },
   // );
  }
}