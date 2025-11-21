import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:_3d_avatar_gen/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.bg).existsSync(), isTrue);
    expect(File(Images.circle).existsSync(), isTrue);
    expect(File(Images.dot).existsSync(), isTrue);
    expect(File(Images.e1).existsSync(), isTrue);
    expect(File(Images.e2).existsSync(), isTrue);
    expect(File(Images.e3).existsSync(), isTrue);
    expect(File(Images.e4).existsSync(), isTrue);
    expect(File(Images.e5).existsSync(), isTrue);
    expect(File(Images.h1).existsSync(), isTrue);
    expect(File(Images.h2).existsSync(), isTrue);
    expect(File(Images.h3).existsSync(), isTrue);
    expect(File(Images.h4).existsSync(), isTrue);
    expect(File(Images.h5).existsSync(), isTrue);
    expect(File(Images.h6).existsSync(), isTrue);
    expect(File(Images.i1).existsSync(), isTrue);
    expect(File(Images.i2).existsSync(), isTrue);
    expect(File(Images.i3).existsSync(), isTrue);
    expect(File(Images.i4).existsSync(), isTrue);
    expect(File(Images.menu).existsSync(), isTrue);
    expect(File(Images.setting).existsSync(), isTrue);
  });
}
