
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_test_appp/bloc/auth/auth_event.dart';
import 'package:my_test_appp/bloc/auth/auth_state.dart';
import 'package:my_test_appp/utils/pref_manager.dart';
import 'package:my_test_appp/utils/web_client.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()){

    //Refresh
    on<AuthRefreshEvent>((event, emit) => emit(AuthRefreshState()));

    // check auth
    on<CheckUserActiveEvent>((event, emit)async {
      String? token= await PrefManager.getToken();

      if(token == null|| token == ""   ) {
        emit (UserNotActiveState());
      } else {
        emit (UserActiveState());
      }
    });

    // Registration
    on<RegistrationSubmitEvent>((event, emit)async {
      emit (AuthProgressState());

      Map sendData = {
        "cRegName": event.name,
        "cRegEmail": event.email,
        "cRegPhone": event.phone,
        "cOTP": "1234"
      };
      print(sendData.toString());

      try{
        print("Into");
        var response = await ApiServices.servicePost('/Registration', sendData);
        if(response[0]['Status'] == "success") {
          PrefManager.setToken(response[0]['customerId'].toString());
          emit (RegistrationSuccessState());
        }
        else {
          emit (RegistrationErrorState(errorMsg: response[0]['Message']));
        }
      }

      catch(e){
        print(e.toString());
        emit (RegistrationErrorState(errorMsg: e.toString()));
      }
    });


    //OTP Verification
    on<OTPVerify>((event, emit)async {
      emit (AuthProgressState());
      var id = await PrefManager.getToken();
      print(id);

      Map sendData = {
        "nCustomerId": id,
        "cOTP": event.otp
      };
      Map sendData2 = {
        "cRegPhone": event.phone,
        "cOTP": event.otp
      };
      try{
        var response;
        if(event.from == "signUp") {
          response = await ApiServices.servicePost('/Verification', sendData);
        } else if(event.from == "login") {
          response = await ApiServices.servicePost('/Login', sendData2);
        }

        if(response[0]['Status'].toLowerCase() == "success") {
          PrefManager.setToken(response[0]['customerId'].toString()) ;
          emit (OTPSuccessState());

        }
        else {
          emit (OTPErrorState(errorMsg: response[0]['Message']));
        }
      }
      catch(e){
        print(e.toString());
        emit (OTPErrorState(errorMsg: e.toString()));
      }
    });




  }
}