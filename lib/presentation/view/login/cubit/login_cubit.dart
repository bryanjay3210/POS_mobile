import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:price_checker/services/auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState(isLoading: false, isLogin: false, isAdmin: false));

  void signIn({required String email, required String password}) async {
    emit(state.copyWith(isLoading: true));
    dynamic result = await AuthService().signInWithEmailAndPassword(email: email, password: password);
    if(result != null){
      if(email.contains('admin')){
        emit(state.copyWith(isLoading: false, isLogin: true, isAdmin: true));
      } else {
        emit(state.copyWith(isLoading: false, isLogin: true, isAdmin: false));
      }
    } else {
      emit(state.copyWith(isLoading: false, isLogin: false));
    }
  }

  void signOut() async{
    AuthService().signOut();
    emit(state.copyWith(isLogin: false));
  }

}
