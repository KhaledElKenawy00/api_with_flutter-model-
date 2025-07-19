import 'package:api_test/core/errors/failure.dart';
import 'package:api_test/features/comments/domain/entity/comment_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CommentRepository {
  Future<Either<Failure, List<CommentEntity>>> getComments(int postId);
}
