

import 'package:dartz/dartz.dart';

import '../../../../core/response-types/response_types.dart';
import '../../../../core/use-cases/use_case.dart';
import '../../data/models/sms_model.dart';
import '../repositories/sign_up_repository.dart';

class SendSmsUseCase implements UseCase<SmsModel, SmsUseCaseParams> {
  final SignUpRepository signUpRepository;

  SendSmsUseCase({required this.signUpRepository});

  @override
  Future<Either<Failure, SmsModel>> call(SmsUseCaseParams params) async {
    return await signUpRepository.sendSmsRequest(params.phone);
  }

}

class SmsUseCaseParams {
  final String phone;

  const SmsUseCaseParams({
    required this.phone,
  });
}
