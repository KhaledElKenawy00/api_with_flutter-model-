import 'package:api_test/core/errors/failure.dart';
import 'package:api_test/features/post/domain/entity/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepo {
  Future<Either<Failure, List<PostEntity>>> getPosts();
}
