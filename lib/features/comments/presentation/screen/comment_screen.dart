import 'package:api_test/features/comments/presentation/cubit/comments_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_test/core/DI/dependancey_injection.dart'; // Make sure getIt is imported

class CommentScreen extends StatelessWidget {
  final int postId; // You'll need to pass the postId to fetch comments for

  const CommentScreen({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CommentsCubit>()..getCommentsForPost(postId),
      child: Scaffold(
        appBar: AppBar(title: const Text('Comments')),
        body: BlocConsumer<CommentsCubit, CommentsState>(
          listener: (context, state) {
            // You could add logic here for showing errors or success messages
          },
          builder: (context, state) {
            if (state is CommentLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CommentLoaded) {
              return ListView.builder(
                itemCount: state.comments.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.comments[index].name),
                    subtitle: Text(state.comments[index].body),
                  );
                },
              );
            } else if (state is CommentError) {
              return Center(
                child: Text(
                  'Error: ${state.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const Center(child: Text('No Comments Available'));
            }
          },
        ),
      ),
    );
  }
}
