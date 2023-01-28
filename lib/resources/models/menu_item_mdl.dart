import 'package:equatable/equatable.dart';

import '../../utils/utils.dart';

class MenuItemMdl extends Equatable {
  final String id;
  final String name;

  const MenuItemMdl({
    this.id = '',
    this.name = '',
  });

  MenuItemMdl copyWith({
    String? id,
    String? name,
  }) {
    return MenuItemMdl(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory MenuItemMdl.fromMap(Map<String, dynamic> map) {
    return MenuItemMdl(
      id: CastValue.toStr(map['id']),
      name: CastValue.toStr(map['name']),
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name];
}
