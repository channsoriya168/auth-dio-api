
import 'package:flutter/material.dart';
class PasswordText extends StatefulWidget {
   PasswordText({
    super.key,
    required TextEditingController passwordController, required this.obscureText, required this.hintText,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;
   bool obscureText;
  final String hintText;

  @override
  State<PasswordText> createState() => _PasswordTextState();
}

class _PasswordTextState extends State<PasswordText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
    //   style:GoogleFonts.acme(
    //   fontSize: 20,
    //   fontWeight: FontWeight.bold
    // ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: IconButton(
          onPressed: (){
            setState(() {
              widget.obscureText=!widget.obscureText;
            });
          },
          icon: Icon(widget.obscureText?Icons.visibility_off:Icons.visibility),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        )
      ),
      controller: widget._passwordController,
       validator: (value){
        if(value!.isEmpty){
          return "Password is required";
        }
        return null;
      },
      obscureText: widget.obscureText,
    );
  }
}
