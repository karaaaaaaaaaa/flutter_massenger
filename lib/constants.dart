
import 'package:flutter/material.dart';

Widget defuilttextform({
  TextEditingController? controller,
  required String lable,
  IconData? prefixicon,
  IconData? suffixicon,
  Function()? suffixclick,
  bool ispassword = false,
  TextInputType keyboardType = TextInputType.emailAddress,
  required dynamic validat,
  required InputBorder Border,
}) =>
    TextFormField(
      
      validator: validat,
      //  (value) {
      //   if (value!.isEmpty) {
      //     return "please enter your emails";
      //   }
      //   return null;
    
      // },
      obscureText: ispassword,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        
          label: Text(lable),
          prefixIcon: Icon(prefixicon),
          suffixIcon: suffixicon != null
              ? IconButton(
                  onPressed: () {
                    suffixclick!();
                  },
                  icon: Icon(suffixicon))
              : null,
          border: Border),
    );


Widget defulttextform({
  TextEditingController? controller,
  required String lable,
  IconData? prefixicon,
  IconData? suffixicon,
  Function()? suffixclick,
  bool ispassword = false,
  TextInputType keyboardType = TextInputType.emailAddress,
  required dynamic validat,
  required InputBorder Border,
}) =>
    TextFormField(
      
      validator: validat,
      //  (value) {
      //   if (value!.isEmpty) {
      //     return "please enter your emails";
      //   }
      //   return null;
    
      // },
      obscureText: ispassword,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        
          label: Text(lable),
          prefixIcon: Icon(prefixicon),
          suffixIcon: suffixicon != null
              ? IconButton(
                  onPressed: () {
                    suffixclick!();
                  },
                  icon: Icon(suffixicon))
              : null,
          border: Border),
    );

