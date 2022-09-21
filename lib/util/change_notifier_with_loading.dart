import 'package:flutter/material.dart';
import 'package:own_portfolio/util/mixin/load_management_mixin.dart';

class ChangeNotifierWithLoading extends ChangeNotifier
    with LoadManagementMixin {
  void fetch({required Future<void> call}) async {
    toggle();
    notifyListeners();
    await call;
    toggle();
    notifyListeners();
  }
}
