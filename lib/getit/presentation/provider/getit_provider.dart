import 'package:flutter/material.dart';
import 'package:test_flutter/getit/presentation/status/status.dart';

class GetItProvider extends ChangeNotifier {

  /// Internal, private state of the GetItProvider.
  Status _state = Status.initial;

  /// State of the GetItProvider.
  Status get state => _state;

  /// Update State of the GetItProvider. This is the only way to modify the
  /// GetItProvider from the outside.
  void fetchData() async {
    _state = Status.loading;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _state = Status.success;
    notifyListeners();
  }
}