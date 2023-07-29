import 'package:flutter/material.dart';
import '../../constants.dart';
import '../widgets/primary_loading_button.dart';
import '../widgets/primary_textfield.dart';
import 'login_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final phoneController = TextEditingController();
  final countryController = TextEditingController();
  final emailController = TextEditingController();

  bool isLoading = false;
  bool obscureText = true;
  bool passwordError = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8,56,8,8),
            child: buildCard(context),
          )
      ),
    );
  }

  Widget buildCard(BuildContext context){
    double cWidth = MediaQuery.of(context).size.width;

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10.0,),
          const Text("Sign Up",style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16,8,16,8),
                child: PrimaryTextfield(controller: nameController, label: "Name"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16,8,16,8),
                child: PrimaryTextfield(controller: userController, label: "Username"),
              ),
              SizedBox(
                width: cWidth,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16,8,16,8),
                child: PrimaryTextfield(controller: phoneController, label: "Phone",textInputType: TextInputType.number,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16,8,16,8),
                child: PrimaryTextfield(controller: emailController, label: "Email"),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(16,8,16,8),
                child: buildPassword(context),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16,8,16,8),
                child: buildConfirmPassword(context),
              ),
              passwordError ?
              const Text("Password doesn't match",style: TextStyle(color: kErrorColor),) : Container(),
              const SizedBox(height: 30.0,),
              PrimaryLoadingButton(buttonName: "Sign Up",isProcessing: isLoading,onTap: () async {
                setState(() {
                  isLoading = true;
                });
                //
                // var user = UserDto(
                //     name: nameController.text,
                //     username: userController.text,
                //     country: countryCode,
                //     email: emailController.text.trim().toLowerCase(),
                //     phone: phoneController.text,
                //     password: passwordController.text
                // );


              },),
              const SizedBox(height: 40.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Have an account already? ",),
                  InkWell(
                    onTap: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
                    },
                    child: const Text("Sign In",
                      style:TextStyle(color: kTertiaryColor,fontWeight: FontWeight.w900),),
                  ),
                ],
              ),
              const SizedBox(height: 10.0,),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildConfirmPassword(BuildContext context) => TextField(
    textCapitalization: TextCapitalization.none,
    onChanged: (value)  {
      if(value != passwordController.text){
        setState(() {
          passwordError = true;
        });
      }else{
        setState(() {
          passwordError = false;
        });
      }
    },
    autocorrect: false,
    enableSuggestions: false,
    keyboardType: TextInputType.text,
    controller: passwordConfirmController,
    obscureText: obscureText ,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    decoration: InputDecoration(
      suffixIcon: IconButton(
          icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          }),
      hintText: "Confirm Password",
      hintStyle: const TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: passwordError ? kErrorColor : kBodyTextColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: passwordError ? kErrorColor : Theme.of(context).primaryColor,
        ),
      ),
    ),
  );

  Widget buildPassword(BuildContext context) => TextField(
    textCapitalization: TextCapitalization.none,
    autocorrect: false,
    enableSuggestions: false,
    keyboardType: TextInputType.text,
    controller: passwordController,
    obscureText: obscureText ,
    style: const TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    decoration: InputDecoration(
      suffixIcon: IconButton(
          icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          }),
      hintText: "Password",
      hintStyle: const TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: kBodyTextColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
      ),
    ),
  );
}
