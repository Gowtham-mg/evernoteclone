import 'package:evernote/hive_helper.dart';
import 'package:evernote/models/app_response.dart';
import 'package:evernote/models/app_token.dart';
import 'package:evernote/repository/token.dart';
import 'package:flutter/widgets.dart';

class LoginTokenRepository extends TokenRepository {
  LoginTokenRepository();
  @override
  AppResponse<AppToken> getToken() {
    try {
      return AppResponse.named(
          data: HiveHelper.getValue(HiveHelper.auth, HiveHelper.token));
    } catch (e) {
      debugPrint("Error Token $e");
      return AppResponse.named(error: e);
    }
  }

  @override
  Future<AppResponse<bool>> saveToken(AppToken appToken) async {
    try {
      await HiveHelper.putValue(HiveHelper.auth, HiveHelper.userId, appToken.userId);
      await HiveHelper.putValue(HiveHelper.auth, HiveHelper.token, appToken.token);
      return AppResponse.named(data: true);
    } catch (e) {
      debugPrint("Error Token $e");
      return AppResponse.named(error: e);
    }
  }

  @override
  Future<AppResponse<bool>> deleteToken() async {
    try {
      await HiveHelper.deleteValue(HiveHelper.auth, HiveHelper.userId);
      await HiveHelper.deleteValue(HiveHelper.auth, HiveHelper.token);
      return AppResponse.named(data: true);
    } catch (e) {
      debugPrint("Error Token $e");
      return AppResponse.named(error: e);
    }
  }
}
