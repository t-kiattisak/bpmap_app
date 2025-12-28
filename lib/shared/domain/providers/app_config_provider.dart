import '../models/app_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_config_provider.g.dart';

@riverpod
AppConfig appConfig(Ref ref) {
  throw UnimplementedError('AppConfig must be overridden in main');
}
