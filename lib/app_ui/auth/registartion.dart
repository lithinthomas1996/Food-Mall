
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_test_appp/app_ui/auth/otp_verify.dart';
import 'package:my_test_appp/bloc/auth/auth_bloc.dart';
import 'package:my_test_appp/bloc/auth/auth_event.dart';
import 'package:my_test_appp/bloc/auth/auth_state.dart';
import 'package:my_test_appp/styles/widget_styles.dart';
import 'package:my_test_appp/utils/regx_validator.dart';

class Registration extends StatefulWidget{
  const Registration({Key? key}) : super(key: key);

  @override
  _Registration createState() => _Registration();
}
class _Registration extends State<Registration>{


  //controllers
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              const SizedBox(height: 20.0,),

              TextFormField(
                keyboardType: TextInputType.name,
                controller: firstNameController,
                decoration:   const InputDecoration(
                  counterText: "",
                  hintText: "First Name",
                ),
                textCapitalization: TextCapitalization.words,
                validator: (v){
                  if(v == null || v== "") {
                    return "Please enter Name";
                  }
                  else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20,),


              TextFormField(
                keyboardType: TextInputType.name,
                controller: lastNameController,
                decoration:   const InputDecoration(
                  counterText: "",
                  hintText: "Last Name",
                ),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 20,),


              TextFormField(
                keyboardType: TextInputType.phone,
                controller: phoneController,
                decoration:   const InputDecoration(
                  counterText: "",
                  hintText: "Phone Number",
                ),
                textCapitalization: TextCapitalization.none,
                validator: (v){
                  RegExp regExp = RegExp(Validation.phoneValidation);
                  if(v == null || v== "") {
                    return "Please enter Phone Number";
                  }
                  else {
                    if (!regExp.hasMatch(v.replaceAll( RegExp(r"\s+"), ""))) {
                      return "Please enter a valid Phone Number" ;
                    } else {
                      return null;
                    }
                  }
                },

              ),
              const SizedBox(height: 20,),

              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration:   const InputDecoration(
                  counterText: "",
                  hintText: "Email-ID",
                ),
                textCapitalization: TextCapitalization.none,
                validator: (v){
                  RegExp regExp = RegExp(Validation.emailValidation);
                  if(v == null || v== "") {
                    return "Please enter Email-Id";
                  }
                  else {
                    if (!regExp.hasMatch(v.replaceAll( RegExp(r"\s+"), ""))) {
                      return "Please enter a valid Email-Id" ;
                    } else {
                      return null;
                    }
                  }
                },

              ),
              const SizedBox(height: 30,),

              SizedBox(
                height: 50,
                width: double.infinity,
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state){
                    if(state is RegistrationSuccessState){
                      Fluttertoast.showToast(msg: 'Success');
                      Navigator.pushNamed(context, "/verify", arguments: AuthVerifyArguments(navFrom: "signUp", phone: phoneController.text));
                      // Navigator.pushNamed(context, "/OTPVerify");

                    }
                    else if(state is RegistrationErrorState){
                      Fluttertoast.showToast(msg: state.errorMsg!);
                    }
                  },
                  builder: (context, state){
                    if(state is AuthProgressState) {
                      return const Center( child:  CupertinoActivityIndicator(),);
                    }
                    else if(state is AuthRefreshState){
                      return TextButton(onPressed: ()=> submit() ,
                        child: const Text("Sign Up", style:  AppWidgets.submitButtonTextStyle ),
                        style: AppWidgets.signInButtonStyle,
                      );
                    }
                    else {
                      return TextButton(onPressed: ()=> submit() ,
                        child: const Text("Sign Up", style:  AppWidgets.submitButtonTextStyle ),
                        style: AppWidgets.signInButtonStyle,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  submit()async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      FocusScope.of(context).unfocus();
      BlocProvider.of<AuthBloc>(context).add(AuthRefreshEvent());
      BlocProvider.of<AuthBloc>(context).add(RegistrationSubmitEvent(
          name: firstNameController.text + " "+ lastNameController.text,
          email: emailController.text,  phone: phoneController.text));
    }
    else{}
  }

}
