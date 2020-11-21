import 'package:evernote/models/app_response.dart';
import 'package:evernote/models/app_token.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:evernote/models/user.dart' as userModel;
import 'package:evernote/repository/auth/login_token.dart';
import 'package:evernote/repository/auth/user.dart';

abstract class LoginRepository {
  Future<AppResponse<AppToken>> signInWithGoogle();
  signUpWithEmailPassword({String email, String password, String path});
  Future<AppResponse<AppToken>> signInWithEmailPassword(
      {String email, String password, String path});
}

class LoginFirebaseRepository extends LoginRepository {
  final LoginTokenRepository loginTokenRepository;
  final UserRepository userRepository;
  final FirebaseAuth firebaseAuth;

  LoginFirebaseRepository(
      this.loginTokenRepository, this.userRepository, this.firebaseAuth);
  @override
  Future<AppResponse<AppToken>> signInWithEmailPassword(
      {String email, String password, String path}) async {
    try {
      var userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      var token = AppToken.named(userId: userCredential.user.uid);
      await loginTokenRepository.saveToken(token);
      userModel.User user =
          userModel.User.named(id: token.userId, email: email, name: "");
      await userRepository.createUser(user);
      return AppResponse.named(data: token);
    } catch (e) {
      return AppResponse.named(error: e.toString());
    }
  }

  @override
  Future<AppResponse<AppToken>> signInWithGoogle() async {
    try {
      GoogleSignIn _googleSign = GoogleSignIn();
      var response = await _googleSign.signIn();
      var authentication = await response.authentication;
      var credential = GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken);
      var googleResponse = await firebaseAuth.signInWithCredential(credential);
      var token = googleResponse.user.uid;
      AppToken appToken = AppToken.named(
        token: token,
      );
      await loginTokenRepository.saveToken(appToken);
      userModel.User user = userModel.User.named(
          id: token, name: googleResponse.user.displayName);
      await userRepository.createUser(user);
      return AppResponse.named(data: appToken);
    } catch (e) {
      return AppResponse.named(error: "$e");
    }
  }

  @override
  signUpWithEmailPassword({String email, String password, String path}) async {
    try {
      var userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      var token = AppToken.named(userId: userCredential.user.uid);
      await loginTokenRepository.saveToken(token);
      userModel.User user =
          userModel.User.named(id: token.userId, email: email, name: "");
      await userRepository.createUser(user);
      return AppResponse.named(data: token);
    } catch (e) {
      return AppResponse.named(error: e.toString());
    }
  }
}
