import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_test_cubit_exception/custom_exception.dart';
import 'package:bloc_test_cubit_exception/test_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

class MockHomeCubit extends MockBloc<int> implements TestCubit {}

main() {
  TestCubit cubit;

  setUp(() {
    cubit = TestCubit();
  });

  tearDown(() {
    cubit?.close();
  });

  group('Home bottom app bar index', () {
    blocTest(
      'emits [] when nothing is added',
      build: () => TestCubit(),
      expect: [],
    );

    blocTest(
      '0, 1 and 2 event\'s indexes should yield coresponding states',
      build: () => TestCubit(),
      act: (TestCubit cubit) =>
          cubit..changeIndex(1)..changeIndex(2)..changeIndex(0),
      expect: [TestIndex(1), TestIndex(2), TestIndex(0)],
    );

    /**
     * Works fine, fixed in bloc_test 7.0.1
     */
    blocTest(
      'index 3 or more should throw exception',
      build: () => TestCubit(),
      act: (TestCubit cubit) => cubit.changeIndex(3),
      errors: [isA<CustomException>()],
    );

    blocTest(
      'index 3 or more should throw exception wrapped in CubitUnhandledErrorException',
      build: () => TestCubit(),
      act: (TestCubit cubit) async => cubit.changeIndexCubitException(3),
      errors: [isA<CustomException>()],
    );
  });
}
