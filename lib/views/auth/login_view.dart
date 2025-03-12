import 'package:auth_dio_api/controllers/auth_controller.dart';
import 'package:auth_dio_api/routes/app_routes.dart';
import 'package:auth_dio_api/views/auth/widgets/auth_button.dart';
import 'package:auth_dio_api/views/auth/widgets/button_media.dart';
import 'package:auth_dio_api/views/auth/widgets/password_text.dart';
import 'package:auth_dio_api/views/auth/widgets/text_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey=GlobalKey<FormState>();
    final TextEditingController _emailController=TextEditingController();
    final TextEditingController _passwordController=TextEditingController();
    final authController=Get.find<AuthController>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text('login'.tr),
                const SizedBox(height: 15,),
                 TextEmail(hintText: "Enter your email",textEditingController: _emailController,),
                 const SizedBox(height: 15,),
                  PasswordText(hintText: "Enter your password",passwordController: _passwordController,obscureText: true,),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (){
                          
                        }, child: const Text("Forgot password?"))
                    ],
                  ),
                ButtonAuth(textButton: "Login", onPressed: () {
                      if(_formKey.currentState!.validate()){
                        authController.login(_emailController.text, _passwordController.text);
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
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: (){
                          Get.toNamed(AppRoutes.REGISTER_VIEW);
                        }, child: const Text("Register"))
                    ],
                 )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

