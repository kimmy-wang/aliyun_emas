// Copyright (c) 2022, Kimmy
// https://kimmy.me
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:aliyun_emas_ios/aliyun_emas_ios.dart';
import 'package:aliyun_emas_platform_interface/aliyun_emas_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AliyunEmasIOS', () {
    const kPlatformName = 'iOS';
    late AliyunEmasIOS aliyunEmas;
    late List<MethodCall> log;

    setUp(() async {
      aliyunEmas = AliyunEmasIOS();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance!.defaultBinaryMessenger
          .setMockMethodCallHandler(aliyunEmas.methodChannel,
              (methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getPlatformName':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      AliyunEmasIOS.registerWith();
      expect(AliyunEmasPlatform.instance, isA<AliyunEmasIOS>());
    });

    test('getPlatformName returns correct name', () async {
      final name = await aliyunEmas.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(name, equals(kPlatformName));
    });
  });
}
