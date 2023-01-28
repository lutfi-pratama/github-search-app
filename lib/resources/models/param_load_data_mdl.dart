import 'package:equatable/equatable.dart';
import '../../utils/utils.dart';

class ParamLoadDataMdl extends Equatable {
  final String? search;
  final int page;
  final int limit;

  const ParamLoadDataMdl({
    this.search,
    this.page = 1,
    this.limit = 20,
  });

  ParamLoadDataMdl copyWith({
    String? search,
    int? page,
    int? limit,
  }) {
    return ParamLoadDataMdl(
      search: search ?? this.search,
      page: page ?? this.page,
      limit: limit ?? this.limit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'q': search,
      'page': page,
      'per_page': limit,
    };
  }

  factory ParamLoadDataMdl.fromMap(Map<String, dynamic> map) {
    return ParamLoadDataMdl(
      search: map['q'] != null ? CastValue.toStr(map['q']) : null,
      page: CastValue.toInteger(map['page']),
      limit: CastValue.toInteger(map['per_page']),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [search!, page, limit];
}
