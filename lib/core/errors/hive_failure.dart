import 'failure.dart';

class HiveFailure extends Failure {
  const HiveFailure(super.message);

  factory HiveFailure.boxNotFound() {
    return const HiveFailure('The requested box was not found.');
  }

  factory HiveFailure.boxAlreadyOpen() {
    return const HiveFailure('The box is already open.');
  }

  factory HiveFailure.boxNotOpen() {
    return const HiveFailure('The box is not open.');
  }

  factory HiveFailure.failedToOpenBox() {
    return const HiveFailure('Failed to open the box.');
  }

  factory HiveFailure.failedToReadData() {
    return const HiveFailure('Failed to read data.');
  }

  factory HiveFailure.failedToWriteData() {
    return const HiveFailure('Failed to write data.');
  }

  factory HiveFailure.failedToDeleteData() {
    return const HiveFailure('Failed to delete data.');
  }

  factory HiveFailure.failedToClearBox() {
    return const HiveFailure('Failed to clear the box.');
  }

  factory HiveFailure.failedToCloseHive() {
    return const HiveFailure('Failed to close Hive.');
  }

  factory HiveFailure.initializationFailed() {
    return const HiveFailure('Failed to initialize Hive.');
  }

  factory HiveFailure.unknown(Object error) {
    return HiveFailure(error.toString());
  }
}