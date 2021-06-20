part of './user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInit extends UserState {
  @override
  List<Object> get props => [];
}

class UserSingingIn extends UserState {
  @override
  List<Object> get props => [];
}

class UserSingInError extends UserState {
  final String message;

  UserSingInError({this.message});

  @override
  List<Object> get props => [message];
}

class UserSingedIn extends UserState {
  final User user;
  final String token;
  UserSingedIn({this.user, this.token});

  @override
  List<Object> get props => [user, token];
}
