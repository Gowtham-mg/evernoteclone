abstract class Base {
  Future<dynamic> online();
  Future<dynamic> offline();
  Future<dynamic> updateOffline(dynamic data);
  Future<dynamic> updateOnline(dynamic data);
  Future<dynamic> addOffline(dynamic data);
  Future<dynamic> addOnline(dynamic data);
}
