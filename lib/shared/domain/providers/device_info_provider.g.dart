// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(deviceInfoService)
const deviceInfoServiceProvider = DeviceInfoServiceProvider._();

final class DeviceInfoServiceProvider
    extends
        $FunctionalProvider<
          DeviceInfoService,
          DeviceInfoService,
          DeviceInfoService
        >
    with $Provider<DeviceInfoService> {
  const DeviceInfoServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceInfoServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceInfoServiceHash();

  @$internal
  @override
  $ProviderElement<DeviceInfoService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DeviceInfoService create(Ref ref) {
    return deviceInfoService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeviceInfoService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeviceInfoService>(value),
    );
  }
}

String _$deviceInfoServiceHash() => r'694e64043cca19e34677981472b50d45bca72fc1';
