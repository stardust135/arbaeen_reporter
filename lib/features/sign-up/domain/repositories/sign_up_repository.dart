import 'package:dartz/dartz.dart';

import '../../../../core/response-types/response_types.dart';
import '../../data/models/sms_model.dart';
import '../entities/user.dart';

abstract class SignUpRepository {
  Future<Either<Failure, User>> getUserData(int wheelId, String phone);
  Future<Either<Failure, SmsModel>> sendSmsRequest(String phone  );
}