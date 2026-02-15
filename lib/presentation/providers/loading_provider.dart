import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading_provider.g.dart';

@Riverpod(keepAlive: true)
class Loading extends _$Loading {
  @override
  bool build() => false;

  int _count = 0;

  void show() {
    _count++;
    state = true;
  }

  void hide() {
    if (_count > 0) _count--;
    if (_count == 0) state = false;
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
