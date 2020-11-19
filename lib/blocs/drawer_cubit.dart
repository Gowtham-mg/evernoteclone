import 'package:evernote/meta/meta_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerCubit extends Cubit<String> {
  DrawerCubit() : super(MetaText.allNotes);

  void updateVal(String val) => emit(val);
}