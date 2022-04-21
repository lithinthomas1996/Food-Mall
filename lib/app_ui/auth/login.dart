

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_test_appp/app_ui/auth/otp_verify.dart';
import 'package:my_test_appp/bloc/auth/auth_bloc.dart';
import 'package:my_test_appp/bloc/auth/auth_event.dart';
import 'package:my_test_appp/bloc/auth/auth_state.dart';
import 'package:my_test_appp/styles/widget_styles.dart';

class Login extends StatefulWidget{
  const Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}
class _Login extends State<Login>{


  // backHandler
  DateTime?  currentBackPressedTime;
  Future<bool> _onWillPop() async {
    DateTime now = DateTime.now();
    if (currentBackPressedTime == null || now.difference(currentBackPressedTime!) > const Duration(seconds: 2)) {
      currentBackPressedTime = now;
      Fluttertoast.showToast(msg: "Press again to exit from app", backgroundColor: Colors.grey);
      return Future.value(false);
    } else{
      exit(0);
    }
  }

  TextEditingController phoneController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Login"),
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [

                const SizedBox(height: 20.0,),

                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  validator: (v){
                    if(v == null || v== "") {
                      return "Please enter Phone Number";
                    }
                    else {
                      return null;
                    }
                  },
                  decoration:  const InputDecoration(
                    counterText: "",
                    hintText: "Phone Number",
                  ),
                ),


                SizedBox(height: MediaQuery.of(context).size.height / 5,),

                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state){

                      if(state is AuthSuccessState) {
                        Navigator.pushNamed(context, "/bottomNavigator");
                      }
                      else if(state is AuthErrorState) {
                        Fluttertoast.showToast(msg: state.errorMsg!);
                      }
                      else {}

                    },
                    builder: (context, state){
                      if(state is AuthProgressState) {
                        return const Center( child:  CupertinoActivityIndicator(),);
                      }

                      else if(state is AuthRefreshState) {
                        return  TextButton(onPressed: ()=>submit(),
                          child: const Text("Login", style: AppWidgets.submitButtonTextStyle),
                          style: AppWidgets.signInButtonStyle,
                        );
                      }

                      else {
                        return  TextButton(onPressed: ()=> submit(),
                          child: const Text("Login", style: AppWidgets.submitButtonTextStyle),
                          style: AppWidgets.signInButtonStyle,
                        );
                      }

                    },

                  ),
                ),

                const SizedBox(height: 20.0,),

                InkWell(
                    onTap: ()=> { FocusScope.of(context).unfocus(), Navigator.pushNamed(context, "/registration")},
                    child:  const Text("Don’t have an account? Create Account",
                      style: TextStyle(color: Colors.black,  fontWeight: FontWeight.w600),
                    )),

              ],
            ),
          ),
        ),
      ),
    );
  }

  submit()async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      FocusScope.of(context).unfocus();
      Navigator.pushNamed(context, "/verify", arguments: AuthVerifyArguments(navFrom: "login", phone: phoneController.text));
      // BlocProvider.of<AuthBloc>(context).add(AuthRefreshEvent());
      // BlocProvider.of<AuthBloc>(context).add(AuthSubmit(email: "",  password: ""));
    }
    else{}
  }

}

