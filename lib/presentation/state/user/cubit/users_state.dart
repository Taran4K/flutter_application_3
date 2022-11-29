part of 'users_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoad extends UserState {}

class UserLoaded extends UserState {
  final List<UserEntity> list;

  UserLoaded(this.list);
}


class UserDelete extends UserState{
  final List<UserEntity> list;

  UserDelete(this.list);
}