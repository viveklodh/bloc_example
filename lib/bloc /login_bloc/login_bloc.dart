import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginSubmitEvent>((event, emit) {
      emit(LoginLoadingState());
      if (event.email != "" &&
          event.email != null &&
          event.password != "" &&
          event.password != null) {
        emit(LoginSuccessState(email: event.email, password: event.password));
      } else {
        emit(LoginFailureState());
      }
    });
  }
}
