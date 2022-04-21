
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_test_appp/bloc/auth/auth_bloc.dart';
import 'package:my_test_appp/bloc/auth/auth_event.dart';
import 'package:my_test_appp/bloc/auth/auth_state.dart';


class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreen createState() => _SplashScreen();
}
class _SplashScreen extends State<SplashScreen>{


  @override
  void initState(){
    super.initState();
    timeCount();
  }

  timeCount() {
    Future.delayed(const Duration(seconds: 2), () {
      BlocProvider.of<AuthBloc>(context).add(CheckUserActiveEvent());
      //Navigator.pushNamed(context, "/appLogin");
    });
  }

  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state){
          if(state is UserActiveState)
            Navigator.pushNamed(context, "/homeScreen");
          else if(state is UserNotActiveState)
            Navigator.pushNamed(context, "/login");
          else{}


        },
        child: const Center(
          child:

        //  Image(image: AssetImage("assets/images/MECX.png"), height: MediaQuery.of(context).size.height / 3,),


          Text("FoodMall",
            style: TextStyle( fontSize: 28, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, maxLines: 2,),

        ),
      ),
    );

  }

}