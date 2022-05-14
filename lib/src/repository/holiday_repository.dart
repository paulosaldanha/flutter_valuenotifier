import 'package:hello/src/models/holiday.dart';
import 'package:hello/src/repository/repository.dart';

class HolidayRepository extends Repository {

  Future<Holiday> add(Holiday entity) async { 
  var dbClient = await database;  
   entity.id = await dbClient!.insert('holiday', entity.toMap());    
   return entity;    
  }    
  

 Future<List<Holiday>> getListaHoliday() async {   
   var dbClient = await database;
   //List<Map> maps = await dbClient.query('entity', columns: ['id','nome','ddi','sigla']);    
   List<Map<String, dynamic>> maps = await dbClient!.rawQuery('select id,name,day,status from holiday where status=?',['A']);    
   List<Holiday> listaHoliday = [];    
   if(maps.isNotEmpty){
     for(int i = 0; i < maps.length; i++){
       listaHoliday.add(Holiday.fromMap(maps[i]));
     }
   }
   return listaHoliday;
 }    
     
 Future<int> delete(int id) async {    
   var dbClient = await database;
   return await dbClient!.delete(    
     'holiday',    
     where: 'id = ?',    
     whereArgs: [id],    
   );    
 }    
     
 Future<int> update(Holiday entity) async {     
   var dbClient = await database;  
   return await dbClient!.update(    
     'holiday',    
     entity.toMap(),    
     where: 'id = ?',    
     whereArgs: [entity.id],    
   );    
 }    
     
Future<Holiday> getById(int id) async {    
   var dbClient = await database;
   List<Map<String, dynamic>> maps = await dbClient!.rawQuery('select id,name,day,status from holiday where id=?',[id]);    
   Holiday entity = Holiday(0,"",DateTime.now(),"");   
   if(maps.isNotEmpty){
     for(int i = 0; i < maps.length; i++){
       entity = Holiday.fromMap(maps[i]);
     }
   }
   return entity;
 }    

 Future close() async {    
   var dbClient = await database;  
   dbClient!.close();    
 }    
}