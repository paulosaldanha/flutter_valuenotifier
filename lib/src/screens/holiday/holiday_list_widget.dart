import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hello/src/components/alert_confirm_widget.dart';
import 'package:hello/src/components/lista_widget.dart';
import 'package:hello/src/controller/holiday_controller.dart';
import 'package:hello/src/models/holiday.dart';
import 'package:hello/src/routes/routing_constants.dart';
import 'package:hello/src/service/holiday_service.dart';
import 'package:hello/src/states/holiday_state.dart';

class HolidayListWidget extends StatelessWidget {

  HolidayListWidget({Key? key}) : super(key: key);
  final holidayCtrl = GetIt.I.get<HolidayController>();

  @override
  Widget build(BuildContext context) {
    holidayCtrl.carregaHoliday();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (text) {
            holidayCtrl.setFilter(text);
            holidayCtrl.controlList();
          },
          decoration: const InputDecoration(hintText: "Pesquisa..."),
        )
      ),
      body: ValueListenableBuilder(
        valueListenable: holidayCtrl,
        builder: (_, state, child) {
          if(state is LoadingHolidayState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is ErrorHolidayState){
            return Center(child: Text(state.message),);
          }

          if(state is SuccessHolidayState){
            return ListView.builder(
              itemCount: state.holidays.length,
              itemBuilder: (_, index) {
                final holiday = state.holidays[index];
                return ListaWidget(
                  key: key,
                  title: holiday.name,
                  subtitle: holiday.dateToShow(),
                  color: (index % 2 == 0) ? Colors.white : Colors.grey[200],
                  removeClicked: () async {
                    var answer = await showAlertConfirm(context, "Deseja Excluir", "Confirmar Exclusao");
                    if(answer == 1){
                      holidayCtrl.removeItem(holiday);
                    }
                  },
                  updateClicked: (){
                    Navigator.of(context).pushNamed(HolidayFormViewRoute,arguments: holiday);
                  },
                );
            });
          }

          return Container();
        
      } ,),
          // aqui quando tiver controller
          /*return paisController.listFiltered != null ? ListView.builder(
            itemCount: paisController.listFiltered.length,
            itemBuilder: (_,index){
              var item = paisController.listFiltered[index];
              return PaisListaWidget(
                pais: item, 
                removeClicked: () async {
                  var retorno = await showAlertConfirm(context, "Deseja Excluir?","Confirmar Exclusão");
                  if(retorno == 1){
                    paisController.removeItem(item);
                  }
                },
                updateClicked: (){
                  Navigator.of(context).pushNamed(CadPaisViewRoute,arguments: item);
                },
              );
            },
            )
            : const Center(
              child: CircularProgressIndicator(),
            );*/
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(HolidayFormViewRoute, arguments: Holiday.padrao());
          },
        ),
    );
  }
  
}