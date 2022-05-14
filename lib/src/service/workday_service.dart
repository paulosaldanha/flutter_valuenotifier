import 'package:hello/src/models/work_day.dart';

import '../repository/workday_repository.dart';

class WorkDayService {
  var _repository;

  WorkDayService(){
    _repository = WorkDayRepository();

  }

  Future<WorkDay> saveOrUpdate(WorkDay entity) async {
    WorkDay entityretorno;
    if(entity.id == 0){
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

  Future<List<WorkDay>> getListaWorkDay() async {
    
    return await _repository.getListaWorkDay();
  }

  Future<WorkDay> getById(int id) async {  
    return await _repository.getById(id);
  }

  void close(){
    _repository.close();
  }

}