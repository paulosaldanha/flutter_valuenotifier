import 'package:flutter/material.dart';
import 'package:hello/src/models/holiday.dart';
import 'package:hello/src/service/holiday_service.dart';
import 'package:hello/src/states/holiday_state.dart';

class HolidayController extends ValueNotifier<HolidayState>{
  
  final HolidayService holidayService;

  HolidayController(this.holidayService):super(InitialHolidayState());

  var holiday = Holiday.padrao();
  late List<Holiday> list;
  
  //validador de nome
  String? validateName(){
    if(holiday.name.isEmpty){
      return "Campo obrigatório";
    }
    return null;
  }

  String? validateDate(){
    if(holiday.day.day > 0){
      return "Campo data é obigatorio";
    }
    return null;
  }

  bool get isValid {
    return validateName() == null && validateDate() == null;
  }

  String filter = '';
  //set do filter, ação do campo observavel, toda vez que modificado, muda seu estado, chama a action
  setFilter(String valor) => filter = valor;

  //dados filtrados da lista, carrega a lista com todos ou somente com o criterio do filtro
  List<Holiday> get listFiltered {
    if(filter.isEmpty){
      carregaHoliday();
      //return service.getAll().asObservable();
      return list;
    } else {
      return list.where((holiday) => holiday.name.toLowerCase().contains(filter.toLowerCase())).toList();
    }
  }
 
  Future controlList() async {
    if(filter.isEmpty){
      carregaHoliday();
    } else {
      var listFiltered = list.where((holiday) => holiday.name.toLowerCase().contains(filter.toLowerCase())).toList();
      value = SuccessHolidayState(listFiltered);
    }
  }

  Future carregaHoliday() async {
    try {
      list = await holidayService.getListaHoliday();
      value = SuccessHolidayState(list);
    } catch (e) {
      value = ErrorHolidayState(e.toString());
    }
  }
 
  Future addItem(Holiday model) async {
    try {
      Holiday holiday = await holidayService.saveOrUpdate(model);
      if(model.id! > 0){
        list.removeWhere((element) => element.id == model.id);
      }
      list.add(holiday);
      value = SuccessHolidayState(list);
    } catch (e) {
      value = ErrorHolidayState(e.toString());
    }
    
  }

  //acão do botao remover da lista, botao é observavel na lista widget
  Future removeItem(Holiday model) async {
    model.status = 'I';
    try {
      await holidayService.saveOrUpdate(model);
      list.removeWhere((holiday) => holiday.id == model.id);
      value = SuccessHolidayState(list);
    } catch (e) {
      value = ErrorHolidayState(e.toString());
    }
  
  }

  //ação do botao salvar/atualizar
  /*Future<Holiday> add() async {
    // Holiday holidayretorno;
    // if(holiday.id == null || holiday.id == 0){
    //   holiday.status = 'A';
    //   holidayretorno = await service.add(holiday);
    // }else{
    //   int idholiday = await service.update(holiday);
    //   holidayretorno = holiday;
    // }
    holiday = await holidaySrv.saveOrUpdate(holiday);
    await carregaHoliday();
    listHoliday.add(holiday);
    return holiday;
  }

  //ação do botao atualizar
  Future update(Holiday model) async {
    holiday = await holidaySrv.saveOrUpdate(model);
    await carregaHoliday();
    listHoliday.add(model);
  }*/
}