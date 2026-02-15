// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Loading)
const loadingProvider = LoadingProvider._();

final class LoadingProvider extends $NotifierProvider<Loading, bool> {
  const LoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loadingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loadingHash();

  @$internal
  @override
  Loading create() => Loading();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$loadingHash() => r'1be9500c7b356030b55e07eb4f4486fae5573fc7';

abstract class _$Loading extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
