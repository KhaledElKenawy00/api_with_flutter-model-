import 'package:api_test/features/comments/domain/entity/comment_entity.dart';
import 'package:api_test/features/comments/domain/usecases/get_comments.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final GetComments getComments;
  CommentsCubit({required this.getComments}) : super(CommentInitial());

  void getCommentsForPost(int postId) async {
    emit(CommentLoading());

    final failureOrComments = await getComments.call(postId);
    failureOrComments.fold(
      (failure) => emit(CommentError(error: failure.errMessage)),
      (comments) => emit(CommentLoaded(comments: comments)),
    );
  }
}
