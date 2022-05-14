import 'package:hello/src/models/Employee.dart';
import 'package:hello/src/repository/repository.dart';

class EmployeeRepository extends Repository {

  Future<Employee> add(Employee entity) async { 
  var dbClient = await database;  
   entity.id = await dbClient!.insert('employee', entity.toMap());    
   return entity;    
  }    
  

 Future<List<Employee>> getListaEmployee() async {   
   var dbClient = await database;
   //List<Map> maps = await dbClient.query('entity', columns: ['id','nome','ddi','sigla']);    
   List<Map<String, dynamic>> maps = await dbClient!.rawQuery('select id,name,team,allocation,technology,status from employee where status=?',['A']);    
   List<Employee> listaEmployee = [];    
   if(maps.isNotEmpty){
     for(int i = 0; i < maps.length; i++){
       listaEmployee.add(Employee.fromMap(maps[i]));
     }
   }
   return listaEmployee;
 }    
     
 Future<int> delete(int id) async {    
   var dbClient = await database;
   return await dbClient!.delete(    
     'employee',    
     where: 'id = ?',    
     whereArgs: [id],    
   );    
 }    
     
 Future<int> update(Employee entity) async {     
   var dbClient = await database;  
   return await dbClient!.update(    
     'employee',    
     entity.toMap(),    
     where: 'id = ?',    
     whereArgs: [entity.id],    
   );    
 }    
     
Future<Employee> getById(int id) async {    
   var dbClient = await database;
   List<Map<String, dynamic>> maps = await dbClient!.rawQuery('select id,name,team,allocation,technology,status from employee where id=?',[id]);    
   Employee entity = Employee.padrao();    
   if(maps.isNotEmpty){
     for(int i = 0; i < maps.length; i++){
       entity = Employee.fromMap(maps[i]);
     }
   }
   return entity;
 }    

 Future close() async {    
   var dbClient = await database;  
   dbClient!.close();    
 }    
}