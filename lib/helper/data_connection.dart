import 'package:flutter_bloc/flutter_bloc.dart';
// import 'dart:io';
import 'package:data_connection_checker/data_connection_checker.dart';

class ConnectionHelperCubit extends Cubit<bool> {
  ConnectionHelperCubit() : super(null);

  // void getConnectionStatus()async{
  //   try {
  //     final result = await InternetAddress.lookup('google.com');
  //     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //       emit(true);
  //     }
  //   } on SocketException catch (_) {
  //     emit(false);
  //   }
  // }

  void init() {
    DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          print('Data connection is available.');
          emit(true);
          break;
        case DataConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          emit(false);
          break;
      }
    });
  }
}
