import 'package:evernote/models/app_response.dart';
import 'package:evernote/models/app_token.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:evernote/models/user.dart' as userModel;
import 'package:evernote/repository/login_token.dart';
import 'package:evernote/repository/user.dart';

abstract class LoginRepository {
  Future<AppResponse> signInWithGoogle();
  signUpWithEmailPassword({String email, String password, String path});
  signInWithEmailPassword({String email, String password, String path});
}

class LoginFirebaseRepository extends LoginRepository {
  final LoginTokenRepository loginTokenRepository;
  final UserRepository userRepository;

  LoginFirebaseRepository(this.loginTokenRepository, this.userRepository);
  @override
  signInWithEmailPassword({String email, String password, String path}) {
    // TODO: implement signInWithEmailPassword
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<AppResponse> signInWithGoogle() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      GoogleSignIn _googleSign = GoogleSignIn();
      var response = await _googleSign.signIn();
      var authentication = await response.authentication;
      var credential = GoogleAuthProvider.credential(
          accessToken: authentication.accessToken,
          idToken: authentication.idToken);
      var googleResponse = await firebaseAuth.signInWithCredential(credential);
      var token = googleResponse.user.uid;
      await loginTokenRepository.saveToken(AppToken.named(
        token: token,
      ));
      userModel.User user = userModel.User.named(
          id: token, name: googleResponse.user.displayName);
      await userRepository.createUser(user);
      return AppResponse.named(data: token);
    } catch (e) {
      return AppResponse.named(error: "$e");
    }
  }

  @override
  signUpWithEmailPassword({String email, String password, String path}) {
    // TODO: implement signUpWithEmailPassword
    throw UnimplementedError();
  }
}
