class LoginRespnse{
    late LogInData logInData;
    late int response;
    late String message;
    LoginRespnse.fromJson(Map<String,dynamic> json){
      logInData=LogInData.fromJson(json['data']);
      response=json['response'];
      message=json['message'];
    }
}
class LogInData{
  late String accessToken;
  late String expiration;
  late String refreshToken;
  late User user;
  LogInData.fromJson(Map<String,dynamic> json){
    accessToken=json['accessToken'];
    expiration=json['expiration'];
    refreshToken=json['refreshToken'];
    user=User.fromJson(json['user']);
  }
}
class User{
  late String id;
  late String displayName;
  late String username;
  late String email;
  late String avatar;
  late bool isActive;
  late List<String> roles;
  late List<String> companys;
  late List<String> departments;
  late Employee employee;
  User.fromJson(Map<String,dynamic> json){
    id=json['id'];
    displayName=json['displayName'];
    username=json['username'];
    email=json['email'];
    avatar=json['avatar'];
    isActive=json['isActive'];
    roles=List<String>.from(json['roles']);
    companys=List<String>.from(json['companys']);
    departments=List<String>.from(json['departments']);
    employee=Employee.fromJson(json['employee']);
  }
}
class Employee{
  late int id;
  late String fullName;
  late String jobTitle;
  late String machineEmployeeID;
  late double basicSalary;
  late String nationality;
  late String birthDate;
  late String mobile;
  late String email;
  late String contract;
  late int hiringTypeId;
  late String hiringDate;
  late Company company;
  late Department department;
  late String attendancePattern;
  Employee.fromJson(Map<String,dynamic> json){
    id=json['id'];
    fullName=json['fullName'];
    jobTitle=json['jobTitle'];
    machineEmployeeID=json['machineEmployeeID'];
    basicSalary=json['basicSalary'];
    nationality=json['nationality'];
    birthDate=json['birthDate'];
    mobile=json['mobile'];
    email=json['email'];
    contract=json['contract'];
    hiringTypeId=json['hiringTypeId'];
    hiringDate=json['hiringDate'];
    company=Company.fromJson(json['company']);
    department=Department.fromJson(json['department']);
    attendancePattern=json['attendancePattern'].toString();
  }
}
class Company{
  late int id;
  late String companyName;
  late String businessType;
  late String logoUrl;
  Company.fromJson(Map<String,dynamic> json){
    id=json["id"];
    companyName=json["companyName"];
    businessType=json["businessType"];
    logoUrl=json["logoUrl"];
  }
}
class Department{
  late int id;
  late String departmentName;
  Department.fromJson(Map<String,dynamic> json){
    id=json["id"];
    departmentName=json["departmentName"];
  }
}