// Copyright (c) 2022, Kimmy
// https://kimmy.me
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:aliyun_emas_platform_interface/aliyun_emas_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// The iOS implementation of [AliyunEmasPlatform].
class AliyunEmasIOS extends AliyunEmasPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('plugins.kimmy.me/aliyun_emas_ios');

  /// Registers this class as the default instance of [AliyunEmasPlatform]
  static void registerWith() {
    AliyunEmasPlatform.instance = AliyunEmasIOS();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
