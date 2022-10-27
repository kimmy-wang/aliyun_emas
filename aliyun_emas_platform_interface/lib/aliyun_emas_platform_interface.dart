// Copyright (c) 2022, Kimmy
// https://kimmy.me
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:aliyun_emas_platform_interface/src/method_channel_aliyun_emas.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of aliyun_emas must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `AliyunEmas`.
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
///  this interface will be broken by newly added [AliyunEmasPlatform] methods.
abstract class AliyunEmasPlatform extends PlatformInterface {
  /// Constructs a AliyunEmasPlatform.
  AliyunEmasPlatform() : super(token: _token);

  static final Object _token = Object();

  static AliyunEmasPlatform _instance = MethodChannelAliyunEmas();

  /// The default instance of [AliyunEmasPlatform] to use.
  ///
  /// Defaults to [MethodChannelAliyunEmas].
  static AliyunEmasPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [AliyunEmasPlatform] when they register themselves.
  static set instance(AliyunEmasPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Return the current platform name.
  Future<String?> getPlatformName();
}
