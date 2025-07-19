import 'dart:convert';
import 'package:api_test/core/databases/cache/cache_helper.dart';
import 'package:api_test/core/errors/expentions.dart';
import 'package:api_test/features/post/data/model/post_model.dart';

class PostLocalDataSource {
  final CacheHelper cacheHelper;

  PostLocalDataSource({required this.cacheHelper});
  final String key = "PostToCache";

  void cachePosts(List<PostModel>? posts) {
    if (posts != null) {
      cacheHelper.saveData(
        key: key,
        value: json.encode(posts.map((e) => e.toJson()).toList()),
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<List<PostModel>> getPosts() async {
    final String? posts = await cacheHelper.getData(key: key);
    if (posts != null) {
      return (json.decode(posts) as List)
          .map((e) => PostModel.fromJson(e))
          .toList();
    } else {
      throw CacheExeption(errorMessage: "No Data Found in Cache");
    }
  }
}
