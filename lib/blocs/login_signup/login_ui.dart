import 'package:evernote/models/app_response.dart';
import 'package:evernote/repository/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
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
    emit(LoginUiLoading());
    AppResponse _response = await loginRepository.signInWithGoogle();
    if(_response.isSuccess){
      emit(LoginSignupSuccess());
    }else{
      emit(LoginSignupError());
    }
  }

  void isEmailAvailable(String email)async{
    emit(LoginUiLoading());
    FirebaseAuth _auth = FirebaseAuth.instance;
    List<String> _availableOptions = await _auth.fetchSignInMethodsForEmail(email);
    if(_availableOptions.isEmpty){
      emit(Signup());
    }else{
      emit(Login());
    }
    debugPrint('_availableOptions ${_availableOptions.join(', ')}');
  }

  void handleBackPress(LoginUiState state){
    emit(state);
  }
}