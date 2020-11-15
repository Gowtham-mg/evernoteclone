import 'package:evernote/models/app_response.dart';
import 'package:evernote/models/app_token.dart';
import 'package:evernote/models/user.dart';
import 'package:evernote/repository/token.dart';

abstract class UserRepository {
  final TokenRepository tokenRepository;

  UserRepository(this.tokenRepository);
  Future<AppResponse<User>> getSelf();
  AppResponse<String> getSelfId() {
    AppResponse<AppToken> response = tokenRepository.getToken();
    if (response.isSuccess) {
      return AppResponse.named(data: response.data.userId);
    }
    return AppResponse.named(error: response.error);
  }

  Future<AppResponse<bool>> updateSelf(User user);
  Future<AppResponse<User>> getUser(String userId) async {
    // return ;
    //TODO: getUserDetails
  }

  Future<AppResponse<User>> createUser(User user) async {
    // return ;
    //TODO: createUserDetails
  }
}