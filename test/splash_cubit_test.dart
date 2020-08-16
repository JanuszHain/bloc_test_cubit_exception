import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_test_cubit_exception/splash_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

class MockSplashCubit extends MockBloc<int> implements SplashCubit {}

main() {
  SplashCubit cubit;

  setUp(() {
    cubit = SplashCubit();
  });

  tearDown(() {
    cubit?.close();
  });

  group('Splash states', () {
    blocTest(
      'emits [] when nothing is added',
      build: () => SplashCubit(),
      expect: [],
    );

    blocTest(
      'cubit sends finish state after delay',
      build: () => SplashCubit(),
      wait: Duration(milliseconds: 3000),
      expect: [SplashFinished()],
    );

    // Expect throws error, test doesn't end
    blocTest(
      'failing test: cubit sends finish state after delay',
      build: () => SplashCubit(),
      wait: Duration(milliseconds: 500),
      expect: [SplashFinished()],
    );
  });
}
