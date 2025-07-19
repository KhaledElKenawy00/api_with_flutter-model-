import 'package:api_test/features/comments/presentation/cubit/comments_cubit.dart';
import 'package:api_test/features/comments/presentation/screen/comment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_test/core/databases/cache/cache_helper.dart';
import 'package:api_test/core/DI/dependancey_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  await init(); // Initializes dependencies

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create:
            (_) =>
                getIt<CommentsCubit>()..getCommentsForPost(
                  1,
                ), // Assuming you want to fetch comments for postId 1 initially
        child: const CommentScreen(postId: 1), // Pass the postId here
      ),
    );
  }
}
