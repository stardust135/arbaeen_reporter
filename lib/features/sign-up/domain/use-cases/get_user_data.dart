import 'package:dartz/dartz.dart';

import '../../../../core/response-types/response_types.dart';
import '../../../../core/use-cases/use_case.dart';
import '../entities/user.dart';
import '../repositories/sign_up_repository.dart';

class GetUserDataUseCase implements UseCase<User, UserDataUseCaseParams> {
  final SignUpRepository signUpRepository;

  GetUserDataUseCase({required this.signUpRepository});

  @override
  Future<Either<Failure, User>> call(UserDataUseCaseParams params) async {
    return await signUpRepository.getUserData(params.wheelId, params.phone);
  }

}

class UserDataUseCaseParams {
  final int wheelId;
  final String phone;

  const UserDataUseCaseParams({
    required this.wheelId,
    required this.phone,
  });
}
