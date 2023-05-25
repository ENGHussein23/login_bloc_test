import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc_test/data/models/Leave_model.dart';
import 'package:login_bloc_test/data/models/LoginResponse.dart';
import 'package:login_bloc_test/data/models/LeaveCount.dart';
import 'package:login_bloc_test/business_logic/constants/colors.dart';
import 'package:login_bloc_test/business_logic/cubit/leave_list_cubit.dart';
import '../widgets/leave_widget.dart';
class SecondScreen extends StatelessWidget{
  final LoginRespnse loginResponse;
  final LeaveCount leaveCount;
   SecondScreen({required this.loginResponse,required this.leaveCount});

  int pageNumber = 1;

  @override
  Widget build(BuildContext context) {
    final heightMax = MediaQuery.of(context).size.height;
    final widthMax = MediaQuery.of(context).size.width;
   return Scaffold(
    body:
     Container(
       height: heightMax,
       width: widthMax,
       color: background_color,
       child: Column(
         children: [
           SizedBox(height: 30,),
           Container(
             padding: EdgeInsets.only(left: 15,right: 15),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 const Icon(Icons.menu),
                 const Text("My Leaves"),
                 Row(children: const [
                   Icon(Icons.notifications_none_outlined),
                   SizedBox(width: 7,),
                   Image(image: AssetImage("assets/images/person.png"),
                       height:40,
                       width: 40,
                       fit: BoxFit.cover),
                 ],)
               ],
             ),
           ),
           SizedBox(height: 15,),
           Stack(
             children: [


               //////////////////////
               BlocBuilder<LeaveListCubit, LeaveListState>(
                 builder: (context, state) {
                   if (state is LeaveListLoading) {
                     print(",,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,");
                     context.read<LeaveListCubit>().fetchLeaveList(loginResponse.logInData.user.employee.company.id,loginResponse.logInData.user.employee.department.id,loginResponse.logInData.user.employee.id,pageNumber, 7,
                         loginResponse.logInData.accessToken);
                     pageNumber++;
                     return const Center(
                       child: CircularProgressIndicator(),
                     );
                   } else if (state is LeaveListLoaded) {
                     // Render the list of leaves using the data from the LeaveListLoaded state
                     Leave_List leaveList = state.leaveList;
                     return Container(
                       height: heightMax - 242,
                       child: ListView.builder(
                         shrinkWrap: true,
                         itemCount: leaveList.dataLeave.Leaves.length,
                         itemBuilder: (BuildContext context, int index) {
                           Leave leave = leaveList.dataLeave.Leaves[index];
                           return LeaveWidget(
                             "from ${leave.absenceFrom} to ${leave.absenceTo}",
                             leave.statusName,
                             leave.notes ?? "No Notes",
                             leave.statusName,
                           );
                         },
                       ),
                     );
                   } else if (state is LeaveListError) {
                     // Render an error message with a button to refresh the data
                     return Center(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             state.message,
                             style: TextStyle(fontSize: 18),
                             textAlign: TextAlign.center,
                           ),
                           SizedBox(height: 16),
                           ElevatedButton(
                             onPressed: () {
                               context.read<LeaveListCubit>().fetchLeaveList(loginResponse.logInData.user.employee.company.id,loginResponse.logInData.user.employee.department.id,loginResponse.logInData.user.employee.id,pageNumber, 7,
                                  loginResponse.logInData.accessToken);
                               pageNumber++;
                             },
                             child: Text('Refresh'),
                           ),
                         ],
                       ),
                     );
                   } else {
                     return Container(); // Render an empty container if the state is not recognized
                   }
                 },
               ),


               ////////////////////////////////////////////////////////////////
               // Container(
               //   height: heightMax-85,
               //   // padding: EdgeInsets.all(10),
               //   child:   ListView(
               //     shrinkWrap: true,
               //     children: [
               //       SizedBox(height: 130,),
               //       LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
               //       LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
               //       LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
               //       LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
               //       LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
               //       LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
               //       LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
               //       LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
               //       LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
               //       LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
               //       LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
               //       LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
               //     ],
               //   ),
               // ),
               Container(
                 decoration: const BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage('assets/images/blob - cut.png'),
                     fit: BoxFit.cover,
                   ),
                 ),
                 padding: EdgeInsets.only(bottom: 60,right: 50,left: 50,top: 20),
                 child: Column(
                   children: [
                     Align(
                       alignment: Alignment.topLeft,
                       child: Text(loginResponse.logInData.user.employee.fullName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                     ),
                     const SizedBox(height: 5,),
                     LayoutBuilder(
                       builder: (BuildContext context, BoxConstraints constraints) {
                         double width = constraints.maxWidth;
                         return  Stack(
                           children: [
                             Container(height: 10,
                               width: width,
                               // color: Colors.lightGreenAccent,
                               decoration: const BoxDecoration(
                                 color: Colors.lightGreenAccent,
                                 borderRadius: BorderRadius.all(
                                     Radius.circular(10.0)),

                               ),),
                             Container(height: 10,
                               width: width*(2/10),
                               decoration: const BoxDecoration(
                                 color: Colors.redAccent,
                                 borderRadius: BorderRadius.all(
                                     Radius.circular(10.0)),

                               ),),
                             // Container(height: 5, width: width*(2/10), color: border_color,),
                           ],
                         );
                       },
                     ),
                     const SizedBox(height: 5,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("2 leaves",style: TextStyle(color: Colors.white,fontSize: 14),),
                         Text("${leaveCount.data.maxAnnual} leaves",style: TextStyle(color: Colors.white,fontSize: 14),),
                       ],
                     ),
                     const SizedBox(height: 20,),
                   ],
                 ),
               ),
             ],
           ),


         ],
       ),
     ),
   );
  }
}

/*

 body:BlocBuilder<LeaveListCubit, LeaveListState>(
       builder: (context, state) {
         if (state is LeaveListLoading) {
           return Center(
             child: CircularProgressIndicator(),
           );
         } else if (state is LeaveListLoaded) {
           // Render the list of leaves using the data from the LeaveListLoaded state
           Leave_List leaveList = state.leaveList;
           return Container(
             height: heightMax - 242,
             // padding: EdgeInsets.all(10),
             child: ListView.builder(
               shrinkWrap: true,
               itemCount: leaveList.data.Leaves.length,
               itemBuilder: (BuildContext context, int index) {
                 Leave leave = leaveList.data.Leaves[index];
                 return LeaveWidget(
                   "from ${leave.absenceFrom} to ${leave.absenceTo}",
                   leave.statusName                    ,
                   leave.notes ?? "No Notes",
                   leave.statusName,
                 );
               },
             ),
           );
         } else if (state is LeaveListError) {
           // Render an error message with a button to refresh the data
           return Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(
                   state.message,
                   style: TextStyle(fontSize: 18),
                   textAlign: TextAlign.center,
                 ),
                 SizedBox(height: 16),
                 ElevatedButton(
                   onPressed: () {
                     // context.read<LeaveLisCubit>().fetchLeaveList(
                     //   // Pass in the same parameters as before
                     // );
                   },
                   child: Text('Refresh'),
                 ),
               ],
             ),
           );
         } else {
           return Container(); // Render an empty container if the state is not recognized
         }
       },
     ),
 */