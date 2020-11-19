import 'package:flutter_bloc/flutter_bloc.dart';

class AllNotesSelectedCubit extends Cubit<NotesSelected> {
  AllNotesSelectedCubit() : super(NotesSelected.named(
    ids: [''],
    select: false
  ));

  void updateVal(NotesSelected val) => emit(val);
}

class NotesSelected{
  final bool select;
  final List<String> ids;

  NotesSelected(this.select, this.ids);
  NotesSelected.named({this.select, this.ids});
  NotesSelected copyWith({bool select, List<String> ids}){
    return NotesSelected.named(
      ids: ids ?? this.ids,
      select: select ?? this.select
    );
  }

}
