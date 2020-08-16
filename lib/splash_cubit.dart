import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial()) {
    _delaySplash();
  }

  void _delaySplash() {
    Future.delayed(Duration(milliseconds: 3000), () {
      emit(SplashFinished());
    });
  }
}
