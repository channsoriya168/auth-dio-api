
import 'package:flutter/material.dart';


class ButtonAuth extends StatelessWidget {
  const ButtonAuth({
    super.key, required this.textButton, required this.onPressed,
  });
  final String textButton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(const Color.fromARGB(255, 111, 161, 202)),
         minimumSize:const WidgetStatePropertyAll(Size(double.infinity, 45))
      ),
      onPressed: () {
      onPressed();
      } 
    , child: Text(
      textButton,
      // style: GoogleFonts.acme(
      //   fontSize: 20,
      //   fontWeight: FontWeight.bold
      // ),
    )
    );
  }
}
