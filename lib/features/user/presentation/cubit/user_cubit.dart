import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_test/features/user/domain/usecases/get_user.dart';
import 'package:api_test/features/user/presentation/cubit/user_state.dart';
import 'package:api_test/core/params/params.dart';

class UserCubit extends Cubit<UserState> {
  final GetUser getUser;

  UserCubit({required this.getUser}) : super(UserInitial());

  Future<void> eitherFailureOrUser(int id) async {
    emit(GetUserLoading());
    final failureOrUser = await getUser.call(
      params: UserParams(id: id.toString()),
    );

    failureOrUser.fold(
      (failure) => emit(GetUserFailure(errMessage: failure.errMessage)),
      (user) => emit(GetUserSuccessfully(user: user)),
    );
  }
}
