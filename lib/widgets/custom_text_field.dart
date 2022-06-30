
import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  CustomTextFromField({this.onChange,required  this.hintText,this.obscureText= false,this.textType});
   Function (String) ? onChange ;
  final String ? hintText;
  bool? obscureText;
  TextInputType? textType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      keyboardType: textType,
      validator: (data){
        if(data!.isEmpty){
          return 'field is required';
        }
      },
      onChanged:onChange ,
      decoration: InputDecoration(
        enabledBorder:  OutlineInputBorder(
          borderSide:const BorderSide(
          ),
          borderRadius: BorderRadius.circular(8),
        ) ,
        border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:const BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: hintText,
      ),
    );
  }
}
