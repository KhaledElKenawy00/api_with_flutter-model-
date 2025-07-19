// lib/core/DI/dependancey_injection.dart

import 'package:api_test/core/connection/network_info.dart';
import 'package:api_test/core/databases/api/api_consumer.dart';
import 'package:api_test/core/databases/api/dio_consumer.dart';
import 'package:api_test/core/databases/cache/cache_helper.dart';
import 'package:api_test/features/comments/data/datasource/comment_remote_data_source.dart';
import 'package:api_test/features/comments/data/repo/comment_repo_implemntation.dart';
import 'package:api_test/features/comments/domain/repo/comment_repo.dart';
import 'package:api_test/features/comments/presentation/cubit/comments_cubit.dart';
import 'package:api_test/features/post/data/datasource/post_local_data_source.dart';
import 'package:api_test/features/post/data/datasource/post_remote_data_source.dart';
import 'package:api_test/features/post/data/repo/post_repo_implementation.dart';
import 'package:api_test/features/post/domain/repo/post_repo.dart';
import 'package:api_test/features/post/domain/usecases/get_posts.dart';
import 'package:api_test/features/post/presentation/cubit/post_cubit.dart';
import 'package:api_test/features/user/data/datasourse/user_local_data_source.dart';
import 'package:api_test/features/user/data/datasourse/user_remote_data_source.dart';
import 'package:api_test/features/user/data/repo/user_repo_implementation.dart';
import 'package:api_test/features/user/domain/repo/user_repo.dart';
import 'package:api_test/features/user/domain/usecases/get_user.dart';
import 'package:api_test/features/user/presentation/cubit/user_cubit.dart';
// Import for comments feature
import 'package:api_test/features/comments/domain/usecases/get_comments.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // Core
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(DataConnectionChecker()),
  );
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: getIt()));

  // ✅ Register ApiConsumer as DioConsumer
  getIt.registerLazySingleton<ApiConsumer>(() => getIt<DioConsumer>());

  // Data sources
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSource(api: getIt()),
  );
  getIt.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSource(cacheHelper: getIt()),
  );

  getIt.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSource(apiConsumer: getIt()),
  );
  getIt.registerLazySingleton<PostLocalDataSource>(
    () => PostLocalDataSource(cacheHelper: getIt()),
  );

  // Register data sources for comments
  getIt.registerLazySingleton<CommentRemoteDataSource>(
    () => CommentRemoteDataSource(apiConsumer: getIt()),
  );
  // We might add a CommentLocalDataSource later if needed

  // Repository
  getIt.registerLazySingleton<UserRepo>(
    () => UserRepoImplementation(
      userRemoteDataSource: getIt(),
      userLocalDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  getIt.registerLazySingleton<PostRepo>(
    () => PostRepoImplementation(
      postRemoteDataSource: getIt(),
      postLocalDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  // Register repository for comments
  getIt.registerLazySingleton<CommentRepository>(
    () => CommentRepositoryImpl(
      commentRemoteDataSource: getIt(),
      networkInfo: getIt(),
      // We'll add commentLocalDataSource if we implement local caching
    ),
  );

  // UseCase
  getIt.registerLazySingleton(() => GetUser(userRepo: getIt()));
  getIt.registerLazySingleton(() => GetPosts(postRepo: getIt()));

  // Register use case for comments
  getIt.registerLazySingleton(() => GetComments(commentRepository: getIt()));

  // Cubit
  getIt.registerFactory(() => UserCubit(getUser: getIt()));
  getIt.registerFactory(() => PostCubit(getPosts: getIt()));

  // Register cubit for comments
  getIt.registerFactory(() => CommentsCubit(getComments: getIt()));
}
