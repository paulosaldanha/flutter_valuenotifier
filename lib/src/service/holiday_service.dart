import 'package:hello/src/models/holiday.dart';

import '../repository/holiday_repository.dart';

class HolidayService {
  var _repository;

  HolidayService(){
    _repository = HolidayRepository();

  }

  Future<Holiday> saveOrUpdate(Holiday entity) async {
    Holiday entityretorno;
    if(entity.id == 0 || entity.id == null){
      entity.status = 'A';
      entityretorno = await _repository.add(entity);
    }else{
      int identity = await _repository.update(entity);
      entityretorno = entity;
      entityretorno.id = identity;
    }
    return entityretorno;
  }

  String delete(int id){
    _repository.delete(id);
    return "Deletado com sucesso";
  }

  Future<List<Holiday>> getListaHoliday() async {
    
    return await _repository.getListaHoliday();
  }

  Future<Holiday> getById(int id) async {  
    return await _repository.getById(id);
  }

  void close(){
    _repository.close();
  }

}