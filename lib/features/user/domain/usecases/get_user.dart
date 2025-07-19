import 'package:api_test/core/errors/failure.dart';
import 'package:api_test/core/params/params.dart';
import 'package:api_test/features/user/domain/entites/user_entity.dart';
import 'package:api_test/features/user/domain/repo/user_repo.dart';
import 'package:dartz/dartz.dart';

class GetUser {
  final UserRepo userRepo;

  GetUser({required this.userRepo});

  Future<Either<Failure, UserEntity>> call({required UserParams params}) async {
    return await userRepo.getUser(params: params);
  }
}
