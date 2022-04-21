

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_test_appp/bloc/auth/auth_bloc.dart';
import 'package:my_test_appp/bloc/auth/auth_event.dart';
import 'package:my_test_appp/bloc/auth/auth_state.dart';
import 'package:my_test_appp/bloc/timmer/timerBloc.dart';
import 'package:my_test_appp/bloc/timmer/timerEvent.dart';
import 'package:my_test_appp/bloc/timmer/timerState.dart';
import 'package:my_test_appp/styles/widget_styles.dart';
import 'package:sms_autofill/sms_autofill.dart';


class AuthVerifyArguments {
  final String navFrom, phone;
  AuthVerifyArguments({Key? key, required this.navFrom, required this.phone});
}

class Verify extends StatefulWidget{
  final AuthVerifyArguments? authVerifyArguments;

  const Verify({Key? key, this.authVerifyArguments,}) : super(key: key);

  @override
  _Verify createState() => _Verify();
}
class _Verify extends State<Verify>{

  var _isLoadingForFirstTime = true;

  @override
  void didChangeDependencies() {
    if (_isLoadingForFirstTime) {
      startTimer();
    }
    _isLoadingForFirstTime = false;
    super.didChangeDependencies();
  }



  // timer func
  late Timer _timer;
  late int seconds = 99 ;
  late int minutes;
  void startTimer()  {
    seconds = 99;
    const oneSec =   Duration(seconds: 1);
    _timer =  Timer.periodic(
      oneSec,
          (Timer timer)  async{
        if (seconds == 0) {
          timer.cancel();
          Fluttertoast.showToast(msg: "Oops! OTP expired!");
          Navigator.pop(context);

        } else {
          seconds = seconds - 1;
          BlocProvider.of<TimerBloc>(context).add(TimerRefreshEvent());
          BlocProvider.of<TimerBloc>(context).add(TimerUpdate(seconds: seconds));
        }
      },
    );
  }



  String otp = "";




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('Verify Login'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 30,),
            RichText(
              textAlign: TextAlign.left,
              text:   TextSpan(
                text: 'Enter code that we have sent to your email',
                style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black ),
                children: <TextSpan>[
                  const TextSpan(text: " "),
                  TextSpan(
                      text:  widget.authVerifyArguments!.phone,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black )),

                ],
              ),
            ),



            const SizedBox(height: 30,),
            // auto detect otp

            PinFieldAutoFill(
              autoFocus: true,
              cursor: Cursor(color: Colors.white, height: 0.0,width: 0.0, enabled: false),
              keyboardType: TextInputType.number,
              // inputFormatters: <TextInputFormatter>[
              //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              // ],
              decoration: const BoxTightDecoration   (
                // gapSpace: 20.0,
                strokeWidth: 1.5,
                radius: Radius.circular(8.0),
                strokeColor:  Colors.black,
               // bgColorBuilder: Colors.white,
                textStyle: TextStyle(fontSize: 24, fontWeight:  FontWeight.w700, color: Colors.black ),
              ),
              currentCode: otp,
              codeLength: 4,
              onCodeSubmitted: (code) {
                // _timer.cancel();
                otp = code;
                // if(otp == "1234") {
                //   Navigator.pushNamed(context, "/authVerifySuccess",
                //       arguments: AuthVerifySuccessArguments(email: widget.authVerifyArguments!.email, navFrom: widget.authVerifyArguments!.navFrom));
                // }

              },
              onCodeChanged: (code) {
                if (code!.length == 4) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  otp = code;
                  _timer.cancel();
                  BlocProvider.of<AuthBloc>(context).add(OTPVerify(from: widget.authVerifyArguments!.navFrom ,  otp: otp, phone: widget.authVerifyArguments!.phone));
                }
              },
            ),


            const SizedBox(height: 30.0,),
            BlocBuilder <TimerBloc, TimerState>(
              builder: (context, state){
                if(state is TimerUpdateState) {
                  return Text("00:$seconds ", style: const TextStyle( fontSize: 18, fontWeight: FontWeight.w800),textAlign: TextAlign.start);
                } else if(state is TimerRefreshEvent) {
                  return
                    Text("00:$seconds ", style: const TextStyle(  fontSize: 18, fontWeight: FontWeight.w800),textAlign: TextAlign.start);
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),

            SizedBox(height: MediaQuery.of(context).size.height / 7,),

            SizedBox(
              height: 56,
              width: double.infinity,
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state){
                  if(state is OTPSuccessState){
                    if(widget.authVerifyArguments!.navFrom == "login") {
                      Navigator.pushNamed(context, "/homeScreen");
                    } else {
                      Navigator.pushNamed(context, "/homeScreen");
                    }

                  }

                  else if(state is OTPErrorState){
                    Fluttertoast.showToast(msg: state.errorMsg!);
                  }
                },
                builder: (context, state){
                  if(state is AuthProgressState) {
                    return const Center( child:  CupertinoActivityIndicator(),);
                  }
                  else if(state is AuthRefreshState){
                    return TextButton(onPressed: (){
                      if(otp == "") {
                        Fluttertoast.showToast(msg: "Please enter OTP");
                      }
                      else {
                        BlocProvider.of<AuthBloc>(context).add(OTPVerify( from: widget.authVerifyArguments!.navFrom ,otp: otp,  phone: widget.authVerifyArguments!.phone));
                      }
                    },
                      child: const Text("Verify", style: AppWidgets.submitButtonTextStyle),
                      style: AppWidgets.signInButtonStyle,

                    );
                  }
                  else {
                    return TextButton(onPressed: (){
                      if(otp == "") {
                        Fluttertoast.showToast(msg: "Please enter OTP");
                      }
                      else {
                        BlocProvider.of<AuthBloc>(context).add(OTPVerify(from: widget.authVerifyArguments!.navFrom ,otp: otp,  phone: widget.authVerifyArguments!.phone));
                      }
                    },
                      child: const Text("Verify", style: AppWidgets.submitButtonTextStyle),
                      style: AppWidgets.signInButtonStyle,

                    );
                  }

                },

              ),
            ),
          ],
        ),
      ),
    );

  }


}