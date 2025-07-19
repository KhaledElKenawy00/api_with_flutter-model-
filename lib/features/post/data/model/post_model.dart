import 'package:api_test/features/post/domain/entity/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    required super.id,
    required super.title,
    required super.body,
    required super.userId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
      userId: json['userId'],
    );
  }

  toJson() {
    return {'id': id, 'title': title, 'body': body, 'userId': userId};
  }
}
