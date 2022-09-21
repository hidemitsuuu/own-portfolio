mixin LoadManagementMixin {
  bool _loading = false;

  bool get isLoading => _loading;

  void toggle() {
    _loading = !_loading;
  }
}
