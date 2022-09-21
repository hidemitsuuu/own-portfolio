import 'package:flutter_test/flutter_test.dart';
import 'package:own_portfolio/helper/util/number_format_util.dart';

void main() {
  test('format()のテスト', () {
    for (var value in [
      _Test(input: 0, expected: '0'),
      _Test(input: 1, expected: '1'),
      _Test(input: -1, expected: '-1'),
      _Test(input: null, expected: '--'),
      _Test(input: 999, expected: '999'),
      _Test(input: -999, expected: '-999'),
      _Test(input: 1000, expected: '1,000'),
      _Test(input: -1000, expected: '-1,000'),
      _Test(input: 123456789, expected: '123,456,789'),
    ]) {
      expect(value.input.format(), value.expected);
    }
  });
  test('signFormat()のテスト', () {
    for (var value in [
      _Test(input: 0, expected: '0'),
      _Test(input: 1, expected: '+1'),
      _Test(input: -1, expected: '-1'),
      _Test(input: null, expected: '--'),
      _Test(input: 999, expected: '+999'),
      _Test(input: -999, expected: '-999'),
      _Test(input: 1000, expected: '+1,000'),
      _Test(input: -1000, expected: '-1,000'),
      _Test(input: 123456789, expected: '+123,456,789'),
    ]) {
      expect(value.input.signFormat(), value.expected);
    }
  });
}

class _Test {
  _Test({
    required this.input,
    required this.expected,
  });

  int? input;
  String expected;
}
