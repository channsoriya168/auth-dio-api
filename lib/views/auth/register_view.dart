import 'package:auth_dio_api/controllers/auth_controller.dart';
import 'package:auth_dio_api/routes/app_routes.dart';
import 'package:auth_dio_api/views/auth/widgets/auth_button.dart';
import 'package:auth_dio_api/views/auth/widgets/button_media.dart';
import 'package:auth_dio_api/views/auth/widgets/password_text.dart';
import 'package:auth_dio_api/views/auth/widgets/text_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey=GlobalKey<FormState>();
    final TextEditingController _emailController=TextEditingController();
    final TextEditingController _passwordController=TextEditingController();
    final TextEditingController _confirmPasswordController=TextEditingController();
    final TextEditingController _nameController=TextEditingController();
    final AuthController authController = Get.find<AuthController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('register'.tr),
                   const SizedBox(height: 15,),
                   TextEmail(hintText: "Enter your name",textEditingController: _nameController,),
                   const SizedBox(height: 15,),
                   TextEmail(hintText: "Enter your email",textEditingController: _emailController,),
                   const SizedBox(height: 15,),
                    PasswordText(hintText: "Enter your password",passwordController: _passwordController,obscureText: true,),
                    const SizedBox(height: 15,),
                    PasswordText(hintText: "Enter your confirm password",passwordController: _confirmPasswordController,obscureText: true,),
                    const SizedBox(height: 15,),
                   ButtonAuth(textButton: "Register", onPressed: () {
                      if(_formKey.currentState!.validate()){
                          if(_passwordController.text==_confirmPasswordController.text){
                            authController.register(_nameController.text, _emailController.text, _passwordController.text);
                      }  else
                      {
                        Get.snackbar('Error', 'Password and Confirm Password must be the same');
                      }
                      } 
                   },),
                    const SizedBox(height: 15,),
                   const Row(
                      children: [
                        Expanded(child: Divider()),
                         Text("OR"),
                        Expanded(child: Divider()),
                      ],
                    ),
                     const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
              
                      children: [
                        ButtonMedia(icon: Icons.facebook,onPressed: () {
                          
                        },),
                       ButtonMedia(icon: Icons.email,onPressed: () {
                          
                        },),
                        ButtonMedia(icon: Icons.phone,onPressed: () {
                          
                        },),
                      ],
                    ),
                    
                   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        TextButton(
                          onPressed: (){
                            Get.toNamed(AppRoutes.LOGIN_VIEW);
                          }, child: const Text("Login"))
                      ],
                   )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}