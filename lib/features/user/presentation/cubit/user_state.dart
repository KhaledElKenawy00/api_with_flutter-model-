import 'package:api_test/features/user/domain/entites/user_entity.dart';

class UserState {}

final class UserInitial extends UserState {}

final class UpdateSLider extends UserState {}

final class GetUserSuccessfully extends UserState {
  final UserEntity user;

  GetUserSuccessfully({required this.user});
}

final class GetUserLoading extends UserState {}

final class GetUserFailure extends UserState {
  final String errMessage;

  GetUserFailure({required this.errMessage});
}
