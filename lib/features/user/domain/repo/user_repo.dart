import 'package:api_test/core/errors/failure.dart';
import 'package:api_test/core/params/params.dart';
import 'package:api_test/features/user/domain/entites/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepo {
  Future<Either<Failure, UserEntity>> getUser({required UserParams params});
}
