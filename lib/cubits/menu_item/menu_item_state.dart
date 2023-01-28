part of './menu_item_cubit.dart';

class MenuItemState extends Equatable {
  final MenuItemMdl selectedItem;
  final List<MenuItemMdl> menus;
  final bool isIndexViewData;

  const MenuItemState({
    required this.selectedItem,
    this.menus = const [],
    this.isIndexViewData = false,
  });

  MenuItemState copyWith({
    MenuItemMdl? selectedItem,
    List<MenuItemMdl>? menus,
    bool? isIndexViewData,
  }) {
    return MenuItemState(
      selectedItem: selectedItem ?? this.selectedItem,
      menus: menus ?? this.menus,
      isIndexViewData: isIndexViewData ?? this.isIndexViewData,
    );
  }

  @override
  List<Object> get props => [selectedItem, menus, isIndexViewData];
}
