part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitialState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  String? email;
  String? password;
  LoginSuccessState({this.email, this.password});
  @override
  List<Object?> get props => [email, password];
}

class LoginFailureState extends LoginState {
  @override
  List<Object?> get props => [];
}
