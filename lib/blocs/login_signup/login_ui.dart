import 'package:evernote/models/app_response.dart';
import 'package:evernote/repository/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LoginUiState{}

class LoginUiInitial extends LoginUiState{}
class LoginUiLoading extends LoginUiState{}
class Signup extends LoginUiState{}
class Login extends LoginUiState{}
class LoginSignupSuccess extends LoginUiState{}
class LoginSignupError extends LoginUiState{}

class LoginUiCubit extends Cubit<LoginUiState> {
  final LoginRepository loginRepository;
  LoginUiCubit(this.loginRepository) : super(LoginUiInitial());

  void updateState(LoginUiState state){
    emit(state);
  }

  void signinWithGoogle()async{
    AppResponse _response = await loginRepository.signInWithGoogle();
    if(_response.data){
      emit(LoginSignupSuccess());
    }else{
      emit(LoginSignupError());
    }
  }
}