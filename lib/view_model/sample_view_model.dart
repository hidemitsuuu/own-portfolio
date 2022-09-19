import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:own_portfolio/model/sample_model.dart';
import 'package:own_portfolio/repository/sample_repository.dart';

final sampleViewModelProvider = ChangeNotifierProvider(
  (ref) => SampleViewModel(repository: ref.read(sampleRepositoryProvider))
);

class SampleViewModel extends ChangeNotifier {
  SampleViewModel({required SampleRepository repository}) : _repository = repository;

  final SampleRepository _repository;

  SampleModel? _sample;

  String get count {
    final count = _sample?.count;
    
    // カンマ区切りなどのロジックが入る想定
    return count?.toString() ?? '--';
  }

  Future<void> fetchSample() async {
    final beforeCount = _sample?.count ?? 0;

    _repository.fetchSample(beforeCount)
      .then((value) => _sample = value)
      .catchError((error) { /* エラーハンドリングを必要に応じて */ })
      .whenComplete(() => notifyListeners());
  }
}

