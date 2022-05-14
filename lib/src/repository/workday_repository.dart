import 'package:hello/src/models/work_day.dart';
import 'package:hello/src/repository/repository.dart';

class WorkDayRepository extends Repository {

  Future<WorkDay> add(WorkDay entity) async { 
  var dbClient = await database;  
   entity.id = await dbClient!.insert('workday', entity.toMap());    
   return entity;    
  }    
  

 Future<List<WorkDay>> getListaWorkDay() async {   
   var dbClient = await database;
   //List<Map> maps = await dbClient.query('entity', columns: ['id','nome','ddi','sigla']);    
   List<Map<String, dynamic>> maps = await dbClient!.rawQuery('select id,employee_id,date,hour,status from workday where status=?',['A']);    
   List<WorkDay> listaWorkDay = [];    
   if(maps.isNotEmpty){
     for(int i = 0; i < maps.length; i++){
       listaWorkDay.add(WorkDay.fromMap(maps[i]));
     }
   }
   return listaWorkDay;
 }    
     
 Future<int> delete(int id) async {    
   var dbClient = await database;
   return await dbClient!.delete(    
     'workday',    
     where: 'id = ?',    
     whereArgs: [id],    
   );    
 }    
     
 Future<int> update(WorkDay entity) async {     
   var dbClient = await database;  
   return await dbClient!.update(    
     'workday',    
     entity.toMap(),    
     where: 'id = ?',    
     whereArgs: [entity.id],    
   );    
 }    
     
Future<WorkDay> getById(int id) async {    
   var dbClient = await database;
   List<Map<String, dynamic>> maps = await dbClient!.rawQuery('select id,employee_id,date,hour,status from workday where id=?',[id]);    
   WorkDay entity = WorkDay.padrao();
   if(maps.isNotEmpty){
     for(int i = 0; i < maps.length; i++){
       entity = WorkDay.fromMap(maps[i]);
     }
   }
   return entity;
 }    

 Future close() async {    
   var dbClient = await database;  
   dbClient!.close();    
 }    
}