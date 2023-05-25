import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:login_bloc_test/data/models/Leave_model.dart';
import 'package:login_bloc_test/business_logic/constants/strings.dart';
part 'leave_list_state.dart';

/// all the prints here for debuging

class LeaveListCubit extends Cubit<LeaveListState> {
  late Dio dio;
  LeaveListCubit() : super(LeaveListInitial()){
    dio=Dio();
  }
  late Leave_List leaveList_main;
  Future<void> fetchLeaveList(int companyId, int departmentId,int empId,int pageNumber, int pageSize, String token) async {
    try {
      emit(LeaveListLoading());
      Map<String, dynamic> headers = {
        'Authorization': 'Bearer $token',
        'companyId': companyId,
        'departmentId': departmentId,
        'employeeId': empId,
        'pageNumber': pageNumber,
        'pageSize': pageSize
      };
      Response response = await Dio().get(
        leave_list_get_api,
        options: Options(headers: headers),
      );
      var jsonMap = jsonEncode(response.data);
      Leave_List leaveList = Leave_List.fromJson(json.decode(jsonMap));
      print("leaveList.data.employeeId is ${leaveList.dataLeave.employeeId}");
      print("leaveList.data.Leaves.length is ${leaveList.dataLeave.Leaves.length}");

      for(int i=0;i<leaveList.dataLeave.Leaves.length;i++){
        print(i.toString());
      }
      leaveList_main = Leave_List();
      leaveList_main.dataLeave = DataLeave();
      leaveList_main.dataLeave.Leaves=[];
      for(int i=0;i<leaveList.dataLeave.Leaves.length;i++){
        try{
          leaveList_main.dataLeave.Leaves.add(leaveList.dataLeave.Leaves[i]);
        }catch(e){
          print("this is why i cant add :$e");
        }
      }

      for(int i=0;i<leaveList_main.dataLeave.Leaves.length;i++){
        print("$i ) ${leaveList_main.dataLeave.Leaves[i].absenceFrom} to ${leaveList_main.dataLeave.Leaves[i].absenceTo}");
      }

      print("==========+++++ its worked until here +++++=============");
      emit(LeaveListLoaded(leaveList_main));
    }on DioError catch (e) {
      if (e.type == DioErrorType.connectionError ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.unknown) {
        emit(LeaveListError("No internet connection"));
      } else {
        emit(LeaveListError("An error occurred"));
      }
    }  catch (e) {
      emit(LeaveListError("An error occurred"));
    }
  }
}