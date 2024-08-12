import 'package:dartz/dartz.dart';
import '../../../../core/response-types/response_types.dart';

import '../../../../core/use-cases/use_case.dart';
import '../repositories/sign_up_repository.dart';

class UserRepetitionParams {
  final String phone;

  const UserRepetitionParams({
    required this.phone,
  });
}
