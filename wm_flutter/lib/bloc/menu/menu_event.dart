part of 'menu_bloc.dart';

@immutable
sealed class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object?> get props => [];
}

class LoadMenus extends MenuEvent {}

class LoadMenuWithItems extends MenuEvent {
  final int menuID;
  const LoadMenuWithItems(this.menuID);

  @override
  List<Object?> get props => [menuID];
}

class RefreshMenus extends MenuEvent {}
