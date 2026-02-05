import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wm_client/wm_client.dart';
import 'package:wm_flutter/core/repositories/menu_repository.dart';
import 'package:wm_flutter/core/spc_core.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuRepository menuRepository;
  MenuBloc({required this.menuRepository}) : super(MenuInitial()) {
    // on<MenuEvent>((event, emit) {
    // });
    on<LoadMenus>(fetchActiveMenu);
  }

  Future<void> fetchActiveMenu(LoadMenus event, Emitter<MenuState> emit) async {
    emit(MenusLoading());
    try {
      final menu = await SpcCore.client.menu.getAllActiveMenus();
      menu?.sort((a, b) => a.id!.compareTo(b.id!));
      log(menu.toString());
      emit(MenusLoaded(menu!));
    } catch (e) {
      throw Exception('Failed to load menu with items: $e');
    }
  }
}
