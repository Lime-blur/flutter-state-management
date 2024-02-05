import 'package:mobx/mobx.dart';
import 'package:test_flutter/mobx/presentation/status/status.dart';

part 'data_store.g.dart';

// This is the class used by rest of your codebase
// ignore: library_private_types_in_public_api
class DataStore = _DataStore with _$DataStore;

// The store-class
abstract class _DataStore with Store {

  @observable
  Status state = Status.initial;

  @action
  Future<void> fetchData() async {
    state = Status.loading;

    await Future.delayed(const Duration(seconds: 2));

    state = Status.success;
  }
}