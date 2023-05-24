import 'package:login_bloc_test/data/models/Leave_model.dart';
import 'package:login_bloc_test/data/web_services/leave_list_web_services.dart';

class LeaveListRepository {
  final LeaveListWebServices leaveListWebServices;

  LeaveListRepository(this.leaveListWebServices);

  Future<Leave_List?> getAllLeaves() async {
    try {
      final leave_List = await leaveListWebServices.getLeaveList();
      return leave_List;
    } catch (e) {
      print("$e ");
    }
  }
}