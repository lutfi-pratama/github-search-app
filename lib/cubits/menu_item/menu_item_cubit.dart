import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import '../../resources/resources.dart';

part './menu_item_state.dart';

class MenuItemCubit extends Cubit<MenuItemState> {
  MenuItemCubit()
      : super(const MenuItemState(
            selectedMenu: MenuItemMdl(), isIndexViewData: false));

  void getMenuItem(List<MenuItemMdl> menus) {
    emit(state.copyWith(menus: menus));
  }

  MenuItemMdl getSelectedMenuItem() {
    return state.selectedMenu;
  }

  void updateSelectedMenuItem(MenuItemMdl selectedMenuModul) {
    emit(state.copyWith(selectedItem: selectedMenuModul));
  }

  void onToggleViewData() {
    emit(state.copyWith(isIndexViewData: !state.isIndexViewData));
  }
}
