import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/models/app_response.dart';
import 'package:evernote/models/app_token.dart';
import 'package:evernote/models/user.dart' as userModel;
import 'package:evernote/repository/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

abstract class LoginUiState {}

class LoginUiInitial extends LoginUiState {}

class LoginUiLoading extends LoginUiState {}

class Signup extends LoginUiState {}

class Signin extends LoginUiState {}

class UpgradePremium extends LoginUiState {}

class LoginSignupSuccess extends LoginUiState {
  final bool showTryForFree;

  LoginSignupSuccess(this.showTryForFree);
}

class LoginSignupError extends LoginUiState {
  final String error;

  LoginSignupError(this.error);
}

class LoginUiCubit extends Cubit<LoginUiState> {
  final LoginRepository loginRepository;
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final userBox;

  LoginUiCubit(this.loginRepository, this.auth, this.firestore, this.userBox)
      : super(LoginUiInitial());

  void updateState(LoginUiState state) {
    emit(state);
  }

  Future<List<String>> checkIsUser(String email) async {
    List<String> _availableOptions =
        await auth.fetchSignInMethodsForEmail(email);
    return _availableOptions;
  }

  void isEmailAvailable(String email) async {
    emit(LoginUiLoading());
    List<String> _availableOptions = await checkIsUser(email);
    if (_availableOptions.isEmpty) {
      emit(Signup());
    } else {
      emit(Signin());
    }
    debugPrint('_availableOptions ${_availableOptions.join(', ')}');
  }

  void handleBackPress(LoginUiState state) {
    emit(state);
  }

  userModel.User getNewUserGoogle(String token) {
    return userModel.User.named(
        email: auth.currentUser.email,
        name: auth.currentUser.displayName,
        token: token,
        id: auth.currentUser.uid,
        profilePic: auth.currentUser.photoURL,
        phone: auth.currentUser.phoneNumber,
        isPremiumUser: false,
        noOfDevicesLoggedIn: 1);
  }

  userModel.User getNewUserEmail(String token) {
    return userModel.User.named(
        email: auth.currentUser.email,
        token: token,
        id: auth.currentUser.uid,
        isPremiumUser: false,
        noOfDevicesLoggedIn: 1);
  }

  userModel.User getExistingUserFirebase(
      String token, QuerySnapshot snapshotUser) {
    userModel.User user =
        userModel.User.fromJson(snapshotUser.docs.first.data());
    user = user.copyWith(
      noOfDevicesLoggedIn: user.noOfDevicesLoggedIn + 1,
      token: token,
    );
    return user;
  }

  Future<QuerySnapshot> getQuerySnapshot() async {
    Query queryUser = firestore
        .collection(MetaText.users)
        .where('id', isEqualTo: auth.currentUser.uid);
    QuerySnapshot snapshotUser = await queryUser.get();
    return snapshotUser;
  }

  void signinWithGoogle() async {
    emit(LoginUiLoading());
    AppResponse<AppToken> _response = await loginRepository.signInWithGoogle();
    QuerySnapshot snapshotUser = await getQuerySnapshot();
    if (_response.isSuccess) {
      int size = snapshotUser.size;
      if (size != 1) {
        userModel.User user = getNewUserGoogle(_response.data.token);
        await firestore.collection(MetaText.users).add(user.toJson());
        await userBox.add(user);
        emit(LoginSignupSuccess(true));
      } else {
        userModel.User user =
            getExistingUserFirebase(_response.data.token, snapshotUser);
        await userBox.add(user);
        if (user.isPremiumUser ?? false) {
          if (user.noOfDevicesLoggedIn > 2) {
            emit(UpgradePremium());
          } else {
            await firestore
                .doc('/${MetaText.users}/${snapshotUser.docs.first.id}')
                .update((user.toJson()));
            emit(LoginSignupSuccess(true));
          }
        } else {
          emit(LoginSignupSuccess(false));
        }
      }
    } else {
      emit(LoginSignupError(_response.error));
    }
  }

  void signInWithEmailPassword(String email, String password) async {
    AppResponse<AppToken> appToken = await loginRepository
        .signInWithEmailPassword(email: email, password: password);
    QuerySnapshot snapshotUser = await getQuerySnapshot();
    if (appToken.isSuccess) {
      userModel.User user =
          getExistingUserFirebase(appToken.data.token, snapshotUser);
      await userBox.add(user);
      if (user.isPremiumUser ?? false) {
        if (user.noOfDevicesLoggedIn > 2) {
          emit(UpgradePremium());
        } else {
          await firestore
              .doc('/${MetaText.users}/${snapshotUser.docs.first.id}')
              .update((user.toJson()));
          emit(LoginSignupSuccess(true));
        }
      } else {
        emit(LoginSignupSuccess(false));
      }
    } else {
      emit(LoginSignupError(appToken.error));
    }
  }

  void signUpWithEmailPassword(String email, String password) async {
    AppResponse<AppToken> appToken = await loginRepository
        .signUpWithEmailPassword(email: email, password: password);
    if (appToken.isSuccess) {
      userModel.User user = getNewUserEmail(appToken.data.token);
      await firestore.collection(MetaText.users).add(user.toJson());
      await userBox.add(user);
      emit(LoginSignupSuccess(true));
    } else {
      emit(LoginSignupError(appToken.error));
    }
  }
}
