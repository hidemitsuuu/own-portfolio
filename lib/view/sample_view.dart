import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:own_portfolio/view_model/sample_view_model.dart';

class SampleView extends ConsumerWidget {
  const SampleView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(sampleViewModelProvider);
    final notifier = ref.read(sampleViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    viewModel.limitedCount,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    viewModel.count,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: ElevatedButton(
                onPressed: viewModel.isLoading ? null : notifier.onPressed,
                child: _buttonChild(viewModel.isLoading),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buttonChild(bool isLoading) {
    return isLoading
        ? const Padding(
            padding: EdgeInsets.all(8),
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          )
        : const Padding(
            padding: EdgeInsets.all(16),
            child: Icon(Icons.add),
          );
  }
}
