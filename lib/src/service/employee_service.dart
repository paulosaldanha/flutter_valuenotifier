import 'package:hello/src/models/Employee.dart';

import '../repository/employee_repository.dart';

class EmployeeService {
  var _repository;

  EmployeeService(){
    _repository = EmployeeRepository();

  }

  Future<Employee> saveOrUpdate(Employee entity) async {
    Employee entityretorno;
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

  Future<List<Employee>> getListaEmployee() async {
    
    return await _repository.getListaEmployee();
  }

  Future<Employee> getById(int id) async {  
    return await _repository.getById(id);
  }

  void close(){
    _repository.close();
  }

}