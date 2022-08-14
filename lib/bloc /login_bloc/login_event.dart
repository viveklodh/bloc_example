part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginSubmitEvent extends LoginEvent {
  String? email;
  String? password;

  LoginSubmitEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
