import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:own_portfolio/model/sample_model.dart';

final sampleRepositoryProvider = Provider<SampleRepository>(
  (_) => SampleRepository(),
);

class SampleRepository {
  Future<SampleModel> fetchSample(int count) async {
    await Future.delayed(const Duration(milliseconds: 800));

    return SampleModel(count: count + 1);
  }
}
