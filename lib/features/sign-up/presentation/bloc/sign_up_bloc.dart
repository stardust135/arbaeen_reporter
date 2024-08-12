import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/response-types/response_types.dart';
import '../../data/models/sms_model.dart';
import '../../domain/entities/user.dart';
import '../../domain/use-cases/get_user_data.dart';
import '../../domain/use-cases/send_sms_use_case.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final GetUserDataUseCase userDataUseCase;
  final SendSmsUseCase smsUseCase;

  SignUpBloc({
    required this.userDataUseCase,
    required this.smsUseCase,
  }) : super(
          Initial(),
        ) {
    on<SendSmsEvent>((event, emit) async {
      emit(Loading());
      final result = await smsUseCase(
        SmsUseCaseParams(
          phone: event.phone,
        ),
      );
      emit(_smsCompletedOrErrorState(result, event.firstTimeSending));
    });
  }

  SignUpState _userCompletedOrErrorState(
    Either<Failure, User> result,
  ) {
    return result.fold(
      (failure) => Error(message: Constants.serverErrorText),
      (user) => UserDataCompleted(user: user),
    );
  }

  SignUpState _smsCompletedOrErrorState(
    Either<Failure, SmsModel> result,
    bool firstTimeSending,
  ) {
    return result.fold(
      (failure) => Error(message: Constants.serverErrorText),
      (model) => SmsSent(
        smsModel: model,
        firstTimeSending: firstTimeSending,
      ),
    );
  }
}
