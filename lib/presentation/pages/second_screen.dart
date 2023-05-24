import 'package:flutter/material.dart';
import 'package:login_bloc_test/data/models/LoginResponse.dart';
import 'package:login_bloc_test/data/models/LeaveCount.dart';
import 'package:login_bloc_test/business_logic/constants/colors.dart';

import '../widgets/leave_widget.dart';
class SecondScreen extends StatelessWidget{
  final LoginRespnse loginResponse;
  final LeaveCount leaveCount;
  const SecondScreen({required this.loginResponse,required this.leaveCount});

  @override
  Widget build(BuildContext context) {
    final heightMax = MediaQuery.of(context).size.height;
    final widthMax = MediaQuery.of(context).size.width;
   return Scaffold(
     body: Container(
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
        Container(
          height: heightMax-242,
          // padding: EdgeInsets.all(10),
          child:   ListView(
            shrinkWrap: true,
            children: [
              LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
              LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
              LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
              LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
              LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
              LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
              LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
              LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
              LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
              LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
              LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
              LeaveWidget("from 01/01/2023 to 03/01/2023","annual","No Notes","Accepted"),
            ],
          ),
        )
         ],
       ),
     ),
   );
  }

}