import 'package:api_test/core/databases/api/api_consumer.dart';
import 'package:api_test/core/databases/api/end_points.dart';
import 'package:api_test/features/post/data/model/post_model.dart';

class PostRemoteDataSource {
  final ApiConsumer apiConsumer;

  PostRemoteDataSource({required this.apiConsumer});

  Future<List<PostModel>> getPosts() async {
    final response = await apiConsumer.get(
      "${EndPoints.baserUrl}/${EndPoints.post}",
    );
    return (response as List).map((e) => PostModel.fromJson(e)).toList();
  }
}
