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
      throw CustomException('Index out of bounds');
    }
  }

  Future<void> changeIndexCubitException(int index) async {
    if (index >= 0 && index <= 2) {
      emit(TestIndex(index));
    } else {
      // Doesn't work - test is pending all the time with this code - no idea why
      // throw CubitUnhandledErrorException(this, CustomException('Index out of bounds'));
      // This works
      Future.error(CubitUnhandledErrorException(
          this, CustomException('Index out of bounds')));
    }
  }
}
