class Leave_List{
  late Data data;
  late int response;
  late String message;
  Leave_List.fromJson(Map<String,dynamic> json){
    data=json["data"];
    response=json["response"];
     message=json["message"];
  }
}
class Data{
  late int companyId;
  late String departmentId;
  late int employeeId;
  late String fromDate;
  late String toDate;
  late List <Leave> Leaves;
  Data.fromJson(Map<String,dynamic> json){
    companyId=json["companyId"];
    departmentId=json["departmentId"];
    employeeId=json["employeeId"];
    fromDate=json["fromDate"];
    toDate=json["toDate"];
    Leaves=json["leaves"];
  }
}
class Leave{
  late int id;
  late String employeeName;
  late int statusId;
  late String statusName;
  late String absenceValue;
  late String number;
  late int employeeId;
  late int typeId;
  late String absenceFrom;
  late String absenceTo;
  late String notes;

  Leave.fromJson(Map<String,dynamic> json){
    id=json["id"];
    employeeName=json["employeeName"];
    statusId=json["statusId"];
    statusName=json["statusName"];
    absenceValue=json["absenceValue"];
    number=json["number"];
    employeeId=json["employeeId"];
    typeId=json["typeId"];
    absenceFrom=json["absenceFrom"];
    absenceTo=json["absenceTo"];
    notes=json["notes"];
  }
}