// Autogenerated from Pigeon (v9.0.4), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

class AndroidPromptInfos {
  AndroidPromptInfos({
    required this.title,
    this.subtitle,
    this.description,
    required this.cancelLabel,
    required this.confirmationRequired,
  });

  String title;

  String? subtitle;

  String? description;

  String cancelLabel;

  bool confirmationRequired;

  Object encode() {
    return <Object?>[
      title,
      subtitle,
      description,
      cancelLabel,
      confirmationRequired,
    ];
  }

  static AndroidPromptInfos decode(Object result) {
    result as List<Object?>;
    return AndroidPromptInfos(
      title: result[0]! as String,
      subtitle: result[1] as String?,
      description: result[2] as String?,
      cancelLabel: result[3]! as String,
      confirmationRequired: result[4]! as bool,
    );
  }
}

/// Android-specific options for biometric authentication.
class AndroidOptions {
  AndroidOptions({
    this.promptInfo,
    required this.authenticationValidityDurationSeconds,
    required this.enableStrongBox,
  });

  /// Details of the prompt to show to the user.
  AndroidPromptInfos? promptInfo;

  /// The duration in seconds for which the authentication is valid. If the
  /// user sets it to -1 (default), user must authenticate each time they want
  /// to get or set a secret.
  int authenticationValidityDurationSeconds;

  /// Whether to use the StrongBox hardware-backed keystore.
  /// This feature seems to cause [crashes](https://github.com/authpass/biometric_storage/issues/76),
  /// enable with caution.
  bool enableStrongBox;

  Object encode() {
    return <Object?>[
      promptInfo?.encode(),
      authenticationValidityDurationSeconds,
      enableStrongBox,
    ];
  }

  static AndroidOptions decode(Object result) {
    result as List<Object?>;
    return AndroidOptions(
      promptInfo: result[0] != null
          ? AndroidPromptInfos.decode(result[0]! as List<Object?>)
          : null,
      authenticationValidityDurationSeconds: result[1]! as int,
      enableStrongBox: result[2]! as bool,
    );
  }
}

/// Platform-specific options for biometric authentication.
class BiometricOptions {
  BiometricOptions({
    this.androidOptions,
  });

  /// Android-specific options.
  AndroidOptions? androidOptions;

  Object encode() {
    return <Object?>[
      androidOptions?.encode(),
    ];
  }

  static BiometricOptions decode(Object result) {
    result as List<Object?>;
    return BiometricOptions(
      androidOptions: result[0] != null
          ? AndroidOptions.decode(result[0]! as List<Object?>)
          : null,
    );
  }
}

class _StarknetInterfaceCodec extends StandardMessageCodec {
  const _StarknetInterfaceCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is AndroidOptions) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is AndroidPromptInfos) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is BiometricOptions) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return AndroidOptions.decode(readValue(buffer)!);
      case 129:
        return AndroidPromptInfos.decode(readValue(buffer)!);
      case 130:
        return BiometricOptions.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class StarknetInterface {
  /// Constructor for [StarknetInterface].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  StarknetInterface({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _StarknetInterfaceCodec();

  Future<void> storeSecret(String arg_key, Uint8List arg_privateKey,
      BiometricOptions? arg_biometricOptions) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.StarknetInterface.storeSecret', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
            .send(<Object?>[arg_key, arg_privateKey, arg_biometricOptions])
        as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<void> removeSecret(String arg_key) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.StarknetInterface.removeSecret', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_key]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }

  Future<Uint8List?> getSecret(
      String arg_key, BiometricOptions? arg_biometricOptions) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.StarknetInterface.getSecret', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel
        .send(<Object?>[arg_key, arg_biometricOptions]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return (replyList[0] as Uint8List?);
    }
  }

  Future<bool> biometryAvailable() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.StarknetInterface.biometryAvailable', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList = await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as bool?)!;
    }
  }
}
