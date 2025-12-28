import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/local/storage_service.dart';

part 'storage_provider.g.dart';

@riverpod
FlutterSecureStorage secureStorage(Ref ref) {
  return const FlutterSecureStorage();
}

@riverpod
StorageService storageService(Ref ref) {
  final storage = ref.watch(secureStorageProvider);
  return StorageService(storage);
}
