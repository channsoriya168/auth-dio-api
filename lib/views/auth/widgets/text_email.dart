
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TextEmail extends StatelessWidget {
  const TextEmail({
    super.key, required this.hintText, required this.textEditingController,
  });
final String hintText;
final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
       decoration: InputDecoration(
         hintText: "Enter your email".tr,
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(25),
         )
       ),
       validator: (value){
         if(value!.isEmpty){
           return "Email is required";
         }
         return null;
       },
    );
  }
}