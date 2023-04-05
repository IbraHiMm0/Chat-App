import 'package:chatapp/models/message.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class chatBubble extends StatelessWidget {
  const chatBubble({
    super.key,
   required this.message
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,

      child: Container(

        padding: const EdgeInsets.only(left: 20.0,top: 20.0,bottom: 20.0,right: 18.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),
        decoration: const BoxDecoration(
            color: KPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(32.0) ,
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            )
        ),
        child: Text(
          message.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class chatBubbleTwo extends StatelessWidget {
  const chatBubbleTwo({
    super.key,
    required this.message
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    var em =ModalRoute.of(context)!.settings.arguments ;

    return Align(
      alignment: Alignment.centerRight,

      child: Container(

        padding: const EdgeInsets.only(left: 20.0,top: 20.0,bottom: 20.0,right: 18.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),
        decoration: const BoxDecoration(
            color: Color(0xff006D84),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
              bottomLeft: Radius.circular(32.0) ,
            )
        ),
        child: Text(
          message.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),

      ),
    );
  }
}
