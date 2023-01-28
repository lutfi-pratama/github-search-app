import '../resources/resources.dart';

class ShowData {
  const ShowData._({
    required this.status,
    this.message = '',
  });

  final ShowState status;
  final String message;

  factory ShowData.init() {
    return const ShowData._(status: ShowState.init);
  }

  factory ShowData.loading({String? message}) {
    return ShowData._(status: ShowState.loading, message: message ?? 'Loading');
  }

  factory ShowData.hasData({String? message}) {
    return ShowData._(
        status: ShowState.hasData, message: message ?? 'Data loaded');
  }

  factory ShowData.error({required String message}) {
    return ShowData._(status: ShowState.error, message: message);
  }

  bool get isLoading => status == ShowState.loading;
}
