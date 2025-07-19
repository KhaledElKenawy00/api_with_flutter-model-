import 'package:api_test/features/post/domain/entity/post_entity.dart';
import 'package:api_test/features/post/domain/usecases/get_posts.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final GetPosts getPosts;
  PostCubit({required this.getPosts}) : super(PostInitial());

  void eitherFailureOrPost() async {
    emit(PostLoading());

    final failureOrPost = await getPosts.call();
    failureOrPost.fold(
      (failure) => emit(PostError(error: failure.errMessage)),
      (posts) => emit(PostLoaded(posts: posts)),
    );
  }
}
