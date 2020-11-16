import 'package:evernote/models/app_response.dart';
import 'package:evernote/models/app_token.dart';
import 'package:evernote/models/user.dart';
import 'package:evernote/repository/token.dart';

abstract class UserRepository {
  Future<AppResponse<User>> getSelf();
  AppResponse<String> getSelfId();

  Future<AppResponse<bool>> updateSelf(User user);
  Future<AppResponse<User>> getUser(String userId);

  Future<AppResponse<User>> createUser(User user);
}

class FirebaseUserRepository extends UserRepository {
  final TokenRepository tokenRepository;

  FirebaseUserRepository(this.tokenRepository);
  @override
  Future<AppResponse<User>> getSelf() {
    // TODO: implement getSelf
    throw UnimplementedError();
  }

  @override
  AppResponse<String> getSelfId() {
    AppResponse<AppToken> response = tokenRepository.getToken();
    if (response.isSuccess) {
      return AppResponse.named(data: response.data.userId);
    }
    return AppResponse.named(error: response.error);
  }

  @override
  Future<AppResponse<bool>> updateSelf(User user) {
    // TODO: implement updateSelf
    throw UnimplementedError();
  }

  @override
  Future<AppResponse<User>> createUser(User user) async {
    // return ;
    //TODO: createUserDetails
  }

  @override
  Future<AppResponse<User>> getUser(String userId) async {
    // return ;
    //TODO: getUserDetails
  }
}
