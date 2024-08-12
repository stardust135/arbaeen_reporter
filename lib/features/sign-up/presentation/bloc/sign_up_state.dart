part of 'sign_up_bloc.dart';

abstract class SignUpState {}

class Initial extends SignUpState {}

class Loading extends SignUpState {}

class UserDataCompleted extends SignUpState {
  final User user;

  UserDataCompleted({required this.user});
}

class SmsSent extends SignUpState {
  final SmsModel smsModel;
  final bool firstTimeSending;

  SmsSent({required this.smsModel, required this.firstTimeSending});
}

class Error extends SignUpState {
  final String message;

  Error({required this.message});
}
