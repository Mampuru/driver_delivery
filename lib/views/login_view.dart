import 'package:driver_app/views/signup_view.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/primary_loading_button.dart';
import '../widgets/primary_textfield.dart';
import 'order_view.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final userController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50.0,),
            Image.asset(logoPath,width: 300,),
            const SizedBox(height: 40.0,),
            const Text("Sign In",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PrimaryTextfield(controller: userController, label: "Username"),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PrimaryTextfield(controller: passwordController, label: "Password",obscureText: true,),
                ),
                InkWell(
                    onTap: () async {
                      //forgot password endpoint
                    },
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(200,16,0,16),
                      child: Text("Forgot Password ?",
                        style:TextStyle(color: kTertiaryColor,fontWeight: FontWeight.bold),),
                    )),
                const SizedBox(height: 30.0,),
                PrimaryLoadingButton(buttonName: "Sign In",isProcessing: isLoading,onTap: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderView()));
                },),
                const SizedBox(height: 50.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account ? ",),
                    InkWell(
                      onTap: () async {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpView()));
                      },
                      child: const Text("Sign Up",
                        style:TextStyle(color: kTertiaryColor,fontWeight: FontWeight.w900),),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
