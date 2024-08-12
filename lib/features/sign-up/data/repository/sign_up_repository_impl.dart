import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

import '../../../../core/response-types/response_types.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../domain/repositories/sign_up_repository.dart';
import '../data-sources/sign_up_remote_data_source.dart';
import '../models/sms_model.dart';
import '../models/user_model.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SingUpRemoteDataSource remoteDataSource;

  SignUpRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserModel>> getUserData(
    int wheelId,
    String phone,
  ) async {
    return await _getUserData(
      () => remoteDataSource.getUserData(wheelId, phone),
    );
  }

  Future<Either<Failure, UserModel>> _getUserData(Function getUserData) async {
    try {
      Either<Failure, UserModel> userData = await getUserData();
      return userData.fold(
        (failure) => Left(ServerFailure()),
        (userModel) => Right(userModel),
      );
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, SmsModel>> sendSmsRequest(
    String phone,
  ) async {
    return await _sendSmsRequest(
      () => remoteDataSource.sendSmRequest(phone),
    );
  }
}

Future<Either<Failure, SmsModel>> _sendSmsRequest(Function sendSms) async {
  try {
    final response = await sendSms();
    return Right(response);
  } on ServerException {
    return Left(ServerFailure());
  }
}
