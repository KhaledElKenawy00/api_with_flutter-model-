import 'package:api_test/core/errors/failure.dart';
import 'package:api_test/features/comments/domain/entity/comment_entity.dart';
import 'package:api_test/features/comments/domain/repo/comment_repo.dart';
import 'package:dartz/dartz.dart';

class GetComments {
  final CommentRepository commentRepository;

  GetComments({required this.commentRepository});

  Future<Either<Failure, List<CommentEntity>>> call(int postId) async {
    return await commentRepository.getComments(postId);
  }
}
