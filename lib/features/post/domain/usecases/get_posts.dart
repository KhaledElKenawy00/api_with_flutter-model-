import 'package:api_test/core/errors/failure.dart';
import 'package:api_test/features/post/domain/entity/post_entity.dart';
import 'package:api_test/features/post/domain/repo/post_repo.dart';
import 'package:dartz/dartz.dart';

class GetPosts {
  final PostRepo postRepo;
  GetPosts({required this.postRepo});

  Future<Either<Failure, List<PostEntity>>> call() async {
    return await postRepo.getPosts();
  }
}
