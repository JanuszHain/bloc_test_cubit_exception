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
     * Doesn't work, because exception thrown from Future isn't CubitUnhandledErrorException (unlike from bloc's Stream)
     * Bloc's stream internally is changing thrown error to CubitUnhandledErrorException and throws aagain
     * blocTest doesn't handle exceptions that isn't CubitUnhandledErrorException
     */
    blocTest('index 3 or more should throw exception',
        build: () => TestCubit(),
        act: (TestCubit cubit) => cubit.changeIndex(3),
        errors: [
          isA<CustomException>()
        ]);
  });
}
