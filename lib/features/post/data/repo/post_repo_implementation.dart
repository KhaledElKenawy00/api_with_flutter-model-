import 'package:api_test/core/connection/network_info.dart';
import 'package:api_test/core/errors/expentions.dart';
import 'package:api_test/core/errors/failure.dart';
import 'package:api_test/features/post/data/datasource/post_local_data_source.dart';
import 'package:api_test/features/post/data/datasource/post_remote_data_source.dart';
import 'package:api_test/features/post/domain/entity/post_entity.dart';
import 'package:api_test/features/post/domain/repo/post_repo.dart';
import 'package:dartz/dartz.dart';

class PostRepoImplementation extends PostRepo {
  final NetworkInfo networkInfo;
  final PostRemoteDataSource postRemoteDataSource;
  final PostLocalDataSource postLocalDataSource;

  PostRepoImplementation({
    required this.networkInfo,
    required this.postRemoteDataSource,
    required this.postLocalDataSource,
  });

  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    if (await networkInfo.isConnected!) {
      try {
        final remotePosts = await postRemoteDataSource.getPosts();
        postLocalDataSource.cachePosts(remotePosts);
        return Right(remotePosts);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localPosts = await postLocalDataSource.getPosts();
        return Right(localPosts);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
