import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:own_portfolio/helper/notifier/change_notifier_with_loading.dart';
import 'package:own_portfolio/helper/util/number_format_util.dart';
import 'package:own_portfolio/model/sample_model.dart';
import 'package:own_portfolio/repository/sample_repository.dart';

final sampleViewModelProvider = ChangeNotifierProvider(
    (ref) => SampleViewModel(repository: ref.read(sampleRepositoryProvider)));

class SampleViewModel extends ChangeNotifierWithLoading {
  SampleViewModel({required SampleRepository repository})
      : _repository = repository;

  final SampleRepository _repository;

  SampleModel? _sample;

  @visibleForTesting
  void setSample(SampleModel sample) {
    _sample = sample;
  }

  String get count {
    final count = _sample?.count;

    return count.signFormat();
  }

  String get limitedCount {
    final count = _sample?.count;

    if (count != null && count > 9) {
      return 'over 9';
    }

    return count?.toString() ?? '0';
  }

  Future<void> onPressed() async {
    final beforeCount = _sample?.count ?? 0;

    super.fetch(
        call: _repository
            .fetchSample(beforeCount)
            .then((value) => _sample = value)
            .catchError((error) {
      /* エラーハンドリングを必要に応じて */
    }).whenComplete(() => notifyListeners()));
  }
}
