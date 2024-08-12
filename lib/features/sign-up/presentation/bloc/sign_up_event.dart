part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class SendSmsEvent extends SignUpEvent {
  final String phone;
  final bool firstTimeSending;

  SendSmsEvent({
    required this.phone,
    required this.firstTimeSending,
  });
}