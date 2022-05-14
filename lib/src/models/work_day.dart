class WorkDay {
  late int id;
  late int employeeId;
  late DateTime date;
  late double hour;
  late String status;

  WorkDay(this.id, this.employeeId, this.date, this.hour, this.status);

  WorkDay.padrao();

  Map<String,dynamic> toMap() {
    var map = <String,dynamic>{
      'id': id,
      'employee_id': employeeId,
      'date': date,
      'hour':hour,
      'status': status
    };
    return map;
  }

  WorkDay.fromMap(Map<String,dynamic> map){
    id = map['id'];
    employeeId = map['employee_id'];
    date = map['date'];
    hour = map['hour'];
    status = map['status'];
  }
}