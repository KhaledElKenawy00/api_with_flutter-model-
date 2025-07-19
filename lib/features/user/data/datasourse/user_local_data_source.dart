import 'dart:convert';

import 'package:api_test/core/databases/cache/cache_helper.dart';
import 'package:api_test/core/errors/expentions.dart';
import 'package:api_test/features/user/data/models/user_model.dart';

class UserLocalDataSource {
  final CacheHelper cacheHelper;

  UserLocalDataSource({required this.cacheHelper});
  final String key = "UserToCash";
  cashUser(UserModel? user) {
    if (user != null) {
      cacheHelper.saveData(key: key, value: json.encode(user.toJson()));
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<UserModel?> getUser() async {
    final String? user = await cacheHelper.getData(key: key);
    if (user != null) {
      return Future.value(UserModel.fromJson(json.decode(user)));
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}
