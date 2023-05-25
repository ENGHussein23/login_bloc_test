part of 'leave_list_cubit.dart';

@immutable

abstract class LeaveListState {}

class LeaveListInitial extends LeaveListState {}

class LeaveListLoading extends LeaveListState {}

class LeaveListLoaded extends LeaveListState {
   Leave_List leaveList;
  LeaveListLoaded(this.leaveList);
}

class LeaveListError extends LeaveListState {
  String message;
  LeaveListError(this.message);
}
