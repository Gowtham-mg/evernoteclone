import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit(state) : super(state);

  void updateIndex(int val) => emit(val);
}