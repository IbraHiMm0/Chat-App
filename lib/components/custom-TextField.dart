import 'package:flutter/material.dart';

class customField extends StatelessWidget {
   customField({this.hintText,this.onChanged,this.obs=false});

    String? hintText;
    Function(String)? onChanged;
    bool? obs;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obs!,
      validator: (value) {
        if(value!.isEmpty){
          return 'Field is Required';
        }
      },
      style: const TextStyle(
        color: Colors.white
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder:const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent
            ),

        ),


      ),
    );
  }
}
