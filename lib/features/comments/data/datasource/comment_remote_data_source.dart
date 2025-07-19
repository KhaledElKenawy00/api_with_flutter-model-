import 'package:api_test/core/databases/api/api_consumer.dart';
import 'package:api_test/core/databases/api/end_points.dart';
import 'package:api_test/features/comments/data/model/comment_model.dart';

class CommentRemoteDataSource {
  final ApiConsumer apiConsumer;

  CommentRemoteDataSource({required this.apiConsumer});

  Future<List<CommentModel>> getComments(int postId) async {
    final response = await apiConsumer.get(
      "${EndPoints.baserUrl}/posts/$postId/comments", // Assuming an endpoint like this
    );
    return (response as List).map((e) => CommentModel.fromJson(e)).toList();
  }
}
