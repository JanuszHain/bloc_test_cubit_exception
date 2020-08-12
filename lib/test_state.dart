part of 'test_cubit.dart';

abstract class TestState extends Equatable {
  const TestState();
}

class TestIndex extends TestState {
  final int index;

  const TestIndex(this.index);

  @override
  List<Object> get props => [index];
}
