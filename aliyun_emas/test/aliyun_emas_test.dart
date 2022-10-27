// Copyright (c) 2022, Kimmy
// https://kimmy.me
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:aliyun_emas/aliyun_emas.dart';
import 'package:aliyun_emas_platform_interface/aliyun_emas_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAliyunEmasPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements AliyunEmasPlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('AliyunEmas', () {
    late AliyunEmasPlatform aliyunEmasPlatform;

    setUp(() {
      aliyunEmasPlatform = MockAliyunEmasPlatform();
      AliyunEmasPlatform.instance = aliyunEmasPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name when platform implementation exists',
          () async {
        const platformName = '__test_platform__';
        when(
          () => aliyunEmasPlatform.getPlatformName(),
        ).thenAnswer((_) async => platformName);

        final actualPlatformName = await getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });

      test('throws exception when platform implementation is missing',
          () async {
        when(
          () => aliyunEmasPlatform.getPlatformName(),
        ).thenAnswer((_) async => null);

        expect(getPlatformName, throwsException);
      });
    });
  });
}
