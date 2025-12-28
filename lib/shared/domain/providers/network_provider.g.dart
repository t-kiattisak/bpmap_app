// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'6acec60b7c44971f85364894b2e821927a55a1df';

/// See also [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$authInterceptorHash() => r'6a7bfecef29976fc8f6a9e74800da28f50bdb938';

/// See also [authInterceptor].
@ProviderFor(authInterceptor)
final authInterceptorProvider = AutoDisposeProvider<AuthInterceptor>.internal(
  authInterceptor,
  name: r'authInterceptorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authInterceptorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthInterceptorRef = AutoDisposeProviderRef<AuthInterceptor>;
String _$networkHash() => r'62223b8b4c8268682172010582447f00261d97aa';

/// See also [network].
@ProviderFor(network)
final networkProvider = AutoDisposeProvider<NetworkService>.internal(
  network,
  name: r'networkProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$networkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NetworkRef = AutoDisposeProviderRef<NetworkService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
