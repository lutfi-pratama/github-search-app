import 'package:equatable/equatable.dart';
import '../../utils/utils.dart';

class MetaMdl extends Equatable {
  const MetaMdl({
    required this.code,
    required this.status,
    required this.message,
  });

  final int code;
  final String status;
  final String message;

  MetaMdl copyWith({
    int? code,
    String? status,
    String? message,
  }) {
    return MetaMdl(
      code: code ?? this.code,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'status': status,
      'message': message,
    };
  }

  factory MetaMdl.fromMap(Map<String, dynamic> map) {
    return MetaMdl(
      code: CastValue.toInteger(map['code']),
      status: CastValue.toStr(map['status']),
      message: CastValue.toStr(map['message']),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [code, status, message];
}
