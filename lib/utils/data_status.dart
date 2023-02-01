import '../resources/resources.dart';

class DataStatus {
  const DataStatus._({
    required this.status,
    this.message = '',
  });

  final ShowState status;
  final String message;

  factory DataStatus.init() {
    return const DataStatus._(status: ShowState.init);
  }

  factory DataStatus.loading({String? message}) {
    return DataStatus._(
        status: ShowState.loading, message: message ?? 'Loading');
  }

  factory DataStatus.success({String? message}) {
    return DataStatus._(
        status: ShowState.success, message: message ?? 'Data loaded');
  }

  factory DataStatus.error({required String message}) {
    return DataStatus._(status: ShowState.error, message: message);
  }

  bool get isLoading => status == ShowState.loading;
  bool get isSuccess => status == ShowState.success;
  bool get isError => status == ShowState.error;
}
