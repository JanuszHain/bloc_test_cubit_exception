import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'custom_exception.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestIndex(1));

  Future<void> changeIndex(int index) async {
    if (index >= 0 && index <= 2) {
      emit(TestIndex(index));
    } else {
      throw new CustomException('Index out of bounds');
    }
  }
}
