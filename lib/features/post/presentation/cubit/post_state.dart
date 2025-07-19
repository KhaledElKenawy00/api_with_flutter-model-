part of 'post_cubit.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {}

final class PostLoaded extends PostState {
  final List<PostEntity> posts;
  PostLoaded({required this.posts});
}

final class PostError extends PostState {
  final String error;
  PostError({required this.error});
}
