import 'package:evernote/meta/meta_text.dart';
import 'package:evernote/models/app_response.dart';
import 'package:evernote/models/note.dart';
import 'package:evernote/repository/notes/base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FetchNotesFirebaseRepo extends Base {
  final FirebaseFirestore firestore;
  final String userId;
  FetchNotesFirebaseRepo(this.firestore, this.userId);
  @override
  Future offline() {
    // TODO: implement offline
    throw UnimplementedError();
  }

  @override
  Future online() async {
    try{
      QuerySnapshot snapshot = await firestore
          .collection(MetaText.notes)
          .where('userId', isEqualTo: userId)
          .orderBy('updatedAt')
          .get();
      List<Note> notes =
          snapshot.docs.map((snap) => Note.fromJson(snap.data())).toList();
      return AppResponse.named(data: notes);
    }catch (e){
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
      await firestore.collection(MetaText.notes).doc(data.id).set(data);
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
      await firestore.collection(MetaText.notes).doc(data.id).set(data);
      return AppResponse.named(data: true);
    } catch (e) {
      return AppResponse.named(error: e);
    }
  }
}
