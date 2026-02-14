import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingCubit extends Cubit<bool> {
  LoadingCubit() : super(false);

  int _count = 0;

  void show() {
    _count++;
    emit(true);
  }

  void hide() {
    if (_count > 0) {
      _count--;
    }
    if (_count == 0) {
      emit(false);
    }
  }

  Future<T> wrap<T>(Future<T> Function() future) async {
    try {
      show();
      return await future();
    } finally {
      hide();
    }
  }
}
