import 'package:evernote/models/app_response.dart';
import 'package:evernote/models/app_token.dart';

abstract class TokenRepository {
  AppResponse<AppToken> getToken();
  Future<AppResponse<bool>> deleteToken();
  Future<AppResponse<bool>> saveToken(AppToken appToken);
}