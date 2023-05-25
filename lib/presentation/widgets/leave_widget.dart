import 'package:flutter/material.dart';
import 'package:login_bloc_test/business_logic/constants/colors.dart';
import 'line_in_leave_widget.dart';

class LeaveWidget extends StatelessWidget{
  String Applied_Duration;
  String Types_of_Leave;
  String Notes;
  String Status;

  LeaveWidget(this.Applied_Duration, this.Types_of_Leave, this.Notes, this.Status);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(// Set border color
              color: Colors.transparent,
              width: 1.0), // Set border width
          borderRadius: const BorderRadius.all(
              Radius.circular(10.0)), // Set rounded corner radius
          boxShadow:  [
            BoxShadow(
                blurRadius: 10,
                color: button_color,
                offset: const Offset(1, 3))
          ] // Make rounded corner of border
      ),
      child: Column(
        children: [
          const SizedBox(height: 5,),
          // applied duration
          LineInLeave("assets/images/date.png","Applied Duration",Applied_Duration),
          const SizedBox(height: 20,),
          // Types of Leave
          LineInLeave("assets/images/reason.png","Types of Leave",Types_of_Leave),
          const SizedBox(height: 20,),
          // Notes
          LineInLeave("assets/images/bag.png","Notes",Notes),
          const SizedBox(height: 20,),
          // status
          LineInLeave("assets/images/info.png","Status",Status),
          const SizedBox(height: 5,),
        ],
      ),
    );
  }
}

