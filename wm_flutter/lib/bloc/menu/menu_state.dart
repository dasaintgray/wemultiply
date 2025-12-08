part of 'menu_bloc.dart';

@immutable
sealed class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object?> get props => [];
}

final class MenuInitial extends MenuState {}

final class MenusLoading extends MenuState {}

class MenusLoaded extends MenuState {
  final List<Menu> menus;
  const MenusLoaded(this.menus);

  @override
  List<Object?> get props => [menus];
}

class MenuError extends MenuState {
  final String message;
  const MenuError(this.message);

  @override
  List<Object?> get props => [message];
}
