import 'package:flutter_test/flutter_test.dart';
import 'package:own_portfolio/model/sample_model.dart';
import 'package:own_portfolio/repository/sample_repository.dart';
import 'package:own_portfolio/view_model/sample_view_model.dart';

void main() {
  test('count()のテスト', () {
    for (var value in [
      _Test(inputCount: 0, expected: '0'),
      _Test(inputCount: null, expected: '--'),
      _Test(inputCount: 999, expected: '+999'),
      _Test(inputCount: 1000, expected: '+1,000'),
    ]) {
      final viewModel = SampleViewModel(repository: SampleRepository());
      if (value.inputCount != null) {
        viewModel.setSample(SampleModel(count: value.inputCount!));
      }

      expect(viewModel.count, value.expected);
    }
  });
  test('limitedCount()のテスト', () {
    for (var value in [
      _Test(inputCount: 0, expected: '0'),
      _Test(inputCount: null, expected: '0'),
      _Test(inputCount: 9, expected: '9'),
      _Test(inputCount: 10, expected: 'over 9'),
    ]) {
      final viewModel = SampleViewModel(repository: SampleRepository());
      if (value.inputCount != null) {
        viewModel.setSample(SampleModel(count: value.inputCount!));
      }

      expect(viewModel.limitedCount, value.expected);
    }
  });
}

class _Test {
  _Test({
    required this.inputCount,
    required this.expected,
  });

  int? inputCount;
  String expected;
}
