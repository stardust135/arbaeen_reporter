import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/response-types/response_types.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../models/sms_model.dart';
import '../models/user_model.dart';

abstract class SingUpRemoteDataSource {
  Future<Either<Failure, UserModel>> getUserData(int wheelId, String phone);

  Future<SmsModel> sendSmRequest(String phone );
}

class SingUpRemoteDataSourceImpl implements SingUpRemoteDataSource {
  final Dio dio;

  SingUpRemoteDataSourceImpl({required this.dio});

  @override
  Future<Either<Failure, UserModel>> getUserData(
      int wheelId, String phone) async {
    try {
      Response response = await dio.post(
        Constants.userSignUpUrl,
        options: Options(
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
        queryParameters: {
          'wheel_id': wheelId,
          'phone': phone,
        },
      );
      if (response.statusCode == 200) {
        return Right(UserModel.fromJson(response.data));
      } else {
        return Left(ServerFailure());
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<SmsModel> sendSmRequest(String phone) async {
    try {
      Response response = await dio.post(
        Constants.smsBaseUrl,
        queryParameters: {
          'receptor': phone,
          'template': 'verify1'
        },
      );
      if (response.statusCode == 200) {
        return SmsModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
