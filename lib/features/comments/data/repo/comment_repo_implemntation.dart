import 'package:api_test/core/connection/network_info.dart';
import 'package:api_test/core/errors/expentions.dart';
import 'package:api_test/core/errors/failure.dart';
import 'package:api_test/features/comments/data/datasource/comment_remote_data_source.dart';
import 'package:api_test/features/comments/domain/entity/comment_entity.dart';
import 'package:api_test/features/comments/domain/repo/comment_repo.dart';
import 'package:dartz/dartz.dart';

class CommentRepositoryImpl extends CommentRepository {
  final NetworkInfo networkInfo;
  final CommentRemoteDataSource commentRemoteDataSource;

  CommentRepositoryImpl({
    required this.networkInfo,
    required this.commentRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<CommentEntity>>> getComments(int postId) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteComments = await commentRemoteDataSource.getComments(
          postId,
        );
        // You might want to add local caching here later
        return Right(remoteComments);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      // Handle offline scenario if needed (e.g., fetching from local cache)
      return Left(Failure(errMessage: 'No internet connection'));
    }
  }
}
