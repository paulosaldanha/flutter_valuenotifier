class Employee {

  late int id;
  late String name;
  late String team;
  late String allocation;
  late String technology;
  late String status;

  Employee(this.id, this.name, this.team, this.allocation, this.technology, this.status);

  Employee.padrao();
  
  Map<String,dynamic> toMap() {
    var map = <String,dynamic>{
      'id': id,
      'name': name,
      'team': team,
      'allocation': allocation,
      'technology': technology,
      'status': status
    };
    return map;
  }

  Employee.fromMap(Map<String,dynamic> map){
    id = map['id'];
    name = map['name'];
    team = map['team'];
    allocation = map['allocation'];
    technology = map['technology'];
    status = map['status'];
  }
}