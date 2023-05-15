import 'package:get/get.dart';

enum SyncState {
  preparing, loading, loaded, error;

  isPreparing() => this == preparing;

  isLoading() => this == loading;

  isLoaded() => this == loaded;

  isError() => this == error;
}

abstract class BaseController extends GetxController {
  Rx<SyncState> state = Rx(SyncState.preparing);

  startSyncing() => state.value = SyncState.loading;

  finishSyncing({bool success = true}) => state.value = success ? SyncState.loaded : SyncState.error;

  Future<void> performOperation(Future<void> Function() operation) async {
    startSyncing();
    try {
      await operation();
      finishSyncing(success: true);
    } catch (_) {
      finishSyncing(success: false);
    }
  }
}