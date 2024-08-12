part of 'app_bloc.dart';

abstract class AppEvent {}

class InitData extends AppEvent {
  final WhoCalledBloc whoCalledBloc;

  InitData(this.whoCalledBloc);
}

class FetchData extends AppEvent {
  final Function callApiFunction;
  final WhoCalledBloc whoCalledBloc;

  FetchData({
    required this.callApiFunction,
    required this.whoCalledBloc,
  });
}

class SendData extends AppEvent {}

class ReplaceWidget extends AppEvent {
  final String text;
  final WhoCalledBloc whoCalledBloc;

  ReplaceWidget(this.whoCalledBloc, this.text);
}
