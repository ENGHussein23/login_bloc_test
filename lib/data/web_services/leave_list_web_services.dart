import 'package:dio/dio.dart';
import 'package:login_bloc_test/business_logic/constants/strings.dart';
import 'package:login_bloc_test/data/models/Leave_model.dart';

class LeaveListWebServices{
  late Dio dio;
  LeaveListWebServices(){
    BaseOptions options = BaseOptions(
      baseUrl: base_uri,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
    );
    dio=Dio(options);
  }

  Future<Leave_List?> getLeaveList()async{
    try{
      Response response=await dio.get(leave_list);
      print(response.data.toString());
      return response.data;
    }catch(e){
      print("$e ");
    }
  }
}