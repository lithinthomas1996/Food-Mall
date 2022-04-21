
import 'package:equatable/equatable.dart';
abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CheckUserActiveEvent extends AuthEvent{}

class AuthSubmit extends AuthEvent {
  final String? email, password;
  AuthSubmit({required this.email, required this.password});
}
class AuthRefreshEvent extends AuthEvent {}


// Registration
class RegistrationSubmitEvent extends AuthEvent {
  final String? name, email, phone;
  RegistrationSubmitEvent({required this.name, required this.email, required this.phone});
}


//OTP

class OTPVerify extends AuthEvent {
  final String? from ,  otp, phone;
  OTPVerify({ required this.from, required this.otp, required this.phone});
}