import 'package:api_test/features/post/presentation/cubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_test/core/DI/dependancey_injection.dart'; // Make sure getIt is imported

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PostCubit>()..eitherFailureOrPost(),
      child: BlocConsumer<PostCubit, PostState>(
        listener: (context, state) {
          // You could add logic here for showing errors or success messages
        },
        builder: (context, state) {
          if (state is PostLoading) {
            return Scaffold(
              appBar: AppBar(title: const Text('Posts')),
              body: const Center(child: CircularProgressIndicator()),
            );
          } else if (state is PostLoaded) {
            return Scaffold(
              appBar: AppBar(title: const Text('Posts')),
              body: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.posts[index].title),
                    subtitle: Text(state.posts[index].body),
                  );
                },
              ),
            );
          } else if (state is PostError) {
            return Scaffold(
              appBar: AppBar(title: const Text('Posts')),
              body: Center(
                child: Text(
                  'Error: ${state.error}',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(title: const Text('Posts')),
              body: const Center(child: Text('No Posts Available')),
            );
          }
        },
      ),
    );
  }
}
