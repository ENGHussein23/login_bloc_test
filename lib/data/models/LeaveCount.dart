class LeaveCount{

  late LeaveData data;
  late int response;
  late String message;
  LeaveCount.fromJson(Map<String,dynamic> json){
    data=LeaveData.fromJson(json['data']);
    response=json['response'];
    message=json['message'];
  }
}

class LeaveData{
  late double maxAnnual;
  late int annual;
  late int sickness;
  late int marriage;
  late int workAccident;
  late int death;
  late int unpaid;
  late int others;
  late String hourly;

  LeaveData.fromJson(Map<String,dynamic> json){
    maxAnnual=json['maxAnnual'];
    annual=json['annual'];
    sickness=json['sickness'];
    marriage=json['marriage'];
    workAccident=json['workAccident'];
    death=json['death'];
    unpaid=json['unpaid'];
    others=json['others'];
    hourly=json['hourly'];
  }
}