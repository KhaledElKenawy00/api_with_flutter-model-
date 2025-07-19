import 'package:api_test/core/connection/network_info.dart';
import 'package:api_test/core/errors/expentions.dart';
import 'package:api_test/core/errors/failure.dart';
import 'package:api_test/core/params/params.dart';
import 'package:api_test/features/user/data/datasourse/user_local_data_source.dart';
import 'package:api_test/features/user/data/datasourse/user_remote_data_source.dart';
import 'package:api_test/features/user/domain/entites/user_entity.dart';
import 'package:api_test/features/user/domain/repo/user_repo.dart';
import 'package:dartz/dartz.dart';

class UserRepoImplementation extends UserRepo {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource userRemoteDataSource;
  final UserLocalDataSource userLocalDataSource;

  UserRepoImplementation({
    required this.networkInfo,
    required this.userRemoteDataSource,
    required this.userLocalDataSource,
  });
  @override
  Future<Either<Failure, UserEntity>> getUser({
    required UserParams params,
  }) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = await userRemoteDataSource.getUser(params);
        userLocalDataSource.cashUser(remoteUser);
        return right(remoteUser);
      } on ServerException catch (e) {
        return left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localUser = await userLocalDataSource.getUser();
        return right(localUser!);
      } on CacheExeption catch (e) {
        return left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
