// Copyright (c) 2022, Kimmy
// https://kimmy.me
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:aliyun_emas_platform_interface/aliyun_emas_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

class AliyunEmasMock extends AliyunEmasPlatform {
  static const mockPlatformName = 'Mock';

  @override
  Future<String?> getPlatformName() async => mockPlatformName;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('AliyunEmasPlatformInterface', () {
    late AliyunEmasPlatform aliyunEmasPlatform;

    setUp(() {
      aliyunEmasPlatform = AliyunEmasMock();
      AliyunEmasPlatform.instance = aliyunEmasPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name', () async {
        expect(
          await AliyunEmasPlatform.instance.getPlatformName(),
          equals(AliyunEmasMock.mockPlatformName),
        );
      });
    });
  });
}
