

import 'package:flutter/material.dart';

class ButtonMedia extends StatelessWidget {
  const ButtonMedia({
    super.key, required this.icon, required this.onPressed,
  });
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(40, 40)),
        backgroundColor: WidgetStateProperty.all(Colors.blue),
        //  borderadius
       shape: WidgetStateProperty.all(
             RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)))
      ),
      onPressed: (){
                onPressed();
      }, icon: Icon(icon,color: Colors.white,));
  }
}