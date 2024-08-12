import 'package:dartz/dartz.dart';

import '../../../../core/response-types/response_types.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
