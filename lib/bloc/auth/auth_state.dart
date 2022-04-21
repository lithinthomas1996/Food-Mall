
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}
class AuthInitial extends AuthState {}


class AuthRefreshState extends AuthState {}

class  UserActiveState extends AuthState{}
class  UserNotActiveState extends AuthState{}

class AuthSuccessState extends AuthState {}

class AuthErrorState extends AuthState {
  final String? errorMsg;
  AuthErrorState({required this.errorMsg});
}

class AuthProgressState extends AuthState {}


// Registration
class RegistrationSuccessState extends AuthState {}

class RegistrationErrorState extends AuthState {
  final String? errorMsg;
  RegistrationErrorState({required this.errorMsg});
}


//OTp
class OTPSuccessState extends AuthState {}

class OTPErrorState extends AuthState {
  final String? errorMsg;
  OTPErrorState({required this.errorMsg});
}
