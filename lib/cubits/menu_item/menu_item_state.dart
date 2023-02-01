part of './menu_item_cubit.dart';

class MenuItemState extends Equatable {
  final MenuItemMdl selectedMenu;
  final List<MenuItemMdl> menus;
  final bool isIndexViewData;

  const MenuItemState({
    required this.selectedMenu,
    this.menus = const [],
    this.isIndexViewData = false,
  });

  MenuItemState copyWith({
    MenuItemMdl? selectedItem,
    List<MenuItemMdl>? menus,
    bool? isIndexViewData,
  }) {
    return MenuItemState(
      selectedMenu: selectedItem ?? this.selectedMenu,
      menus: menus ?? this.menus,
      isIndexViewData: isIndexViewData ?? this.isIndexViewData,
    );
  }

  @override
  List<Object> get props => [selectedMenu, menus, isIndexViewData];
}
