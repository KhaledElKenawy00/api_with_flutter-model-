part of 'comments_cubit.dart';

@immutable
sealed class CommentsState {}

final class CommentsInitial extends CommentsState {}

final class CommentInitial extends CommentsState {}

final class CommentLoading extends CommentsState {}

final class CommentLoaded extends CommentsState {
  final List<CommentEntity> comments;
  CommentLoaded({required this.comments});
}

final class CommentError extends CommentsState {
  final String error;
  CommentError({required this.error});
}
