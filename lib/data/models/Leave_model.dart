class Leave_List{
  late DataLeave dataLeave;
  late int response;
  late String message;
  Leave_List();
  Leave_List.fromJson(var json){
    dataLeave=DataLeave.fromJson(json["data"]);
    response=json["response"];
     message=json["message"];
  }
}
class DataLeave{
  late int companyId;
  late int departmentId;
  late int employeeId;
  late String fromDate;
  late String toDate;
  late List <Leave> Leaves;

  DataLeave();

  DataLeave.fromJson(Map<String,dynamic> json){
    companyId=json["companyId"];
    departmentId=json["departmentId"];
    employeeId=json["employeeId"];
    fromDate=json["fromDate"]?? "null";
    toDate=json["toDate"]?? "null";
    Leaves = [];
    if (json["leaves"] != null) {
      Leaves = (json["leaves"] as List)
          .map((item) => Leave.fromJson(item))
          .toList();
    } else {
      Leaves = [];
    }
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
    notes=json["notes"] ?? "null";
  }
}