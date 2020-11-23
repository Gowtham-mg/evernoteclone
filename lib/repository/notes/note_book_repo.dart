import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/models/app_response.dart';
import 'package:evernote/models/notebook.dart';
import 'package:evernote/repository/notes/base.dart';

class FetchNotebooks extends Base {
  final FirebaseFirestore firestore;
  final String userId;

  FetchNotebooks(this.firestore, this.userId);
  @override
  Future offline() {
    // TODO: implement offline
    throw UnimplementedError();
  }

  @override
  Future online() async {
    try {
      QuerySnapshot snapshot = await firestore
          .collection(MetaText.notebooks)
          .where('userId', isEqualTo: userId)
          .orderBy('updatedAt')
          .get();
      List<Notebook> notebooks =
          snapshot.docs.map((snap) => Notebook.fromJson(snap.data())).toList();
      return AppResponse.named(data: notebooks);
    } catch (e) {
      return AppResponse.named(error: e);
    }
  }

  @override
  Future updateOffline(data) {
    // TODO: implement updateOffline
    throw UnimplementedError();
  }

  @override
  Future updateOnline(data) async {
    try {
      await firestore.collection(MetaText.notebooks).doc(data.id).set(data);
      return AppResponse.named(data: true);
    } catch (e) {
      return AppResponse.named(error: e);
    }
  }

  @override
  Future addOffline(data) {
    // TODO: implement addOffline
    throw UnimplementedError();
  }

  @override
  Future addOnline(data) async {
    try {
      await firestore.collection(MetaText.notebooks).doc(data.id).set(data);
      return AppResponse.named(data: true);
    } catch (e) {
      return AppResponse.named(error: e);
    }
  }
}
