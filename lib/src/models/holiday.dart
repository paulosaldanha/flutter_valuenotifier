import 'package:intl/intl.dart';

class Holiday {
  int? id;
  late String name;
  late DateTime day;
  late String status;

  Holiday(this.id, this.name, this.day, this.status);

  Holiday.padrao(){
    id = null;
    name = "";
    day = DateTime.now();
    status = "A";
  }

  String dateToShow(){
    return DateFormat('dd-MM-yyyy').format(day);
  }

  Map<String,dynamic> toMap() {
    var map = <String,dynamic>{
      'id': id,
      'name': name,
      'day': DateFormat('yyyy-MM-dd').format(day),
      'status': status
    };
    return map;
  }

  Holiday.fromMap(Map<String,dynamic> map){
    id = map['id'];
    name = map['name'];
    day = DateFormat('yyyy-MM-dd').parse(map['day']);
    status = map['status'];
  }
}