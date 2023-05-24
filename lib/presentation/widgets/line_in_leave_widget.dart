import 'package:flutter/material.dart';

class LineInLeave extends StatelessWidget{
  String img;
  String Title;
  String Fill;

  LineInLeave(this.img,this.Title, this.Fill);

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [
        Image(image: AssetImage(img),
          fit: BoxFit.contain,
          width: 40,
          height: 40,),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Title,style: TextStyle(color: Colors.grey,fontSize: 17),),
            Text(Fill,style: TextStyle(fontSize: 16),)
          ],
        ),
      ],
    );
  }

}