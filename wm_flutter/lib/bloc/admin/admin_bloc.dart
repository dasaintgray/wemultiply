import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as auth;
import 'package:wm_client/wm_client.dart' hide UserInfo;
import 'package:wm_flutter/core/repositories/admin_repository.dart';

part 'admin_event.dart';
part 'admin_state.dart';

typedef UserInfo = auth.UserInfo;

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final AdminRepository adminRepository;

  AdminBloc({required this.adminRepository}) : super(const AdminState()) {
    on<LoadDashboardStats>(_onLoadDashboardStats);
    on<LoadUsers>(_onLoadUsers);
    on<SearchUsers>(_onSearchUsers);
    on<BlockUser>(_onBlockUser);
    on<UnblockUser>(_onUnblockUser);
    on<LoadProducts>(_onLoadProducts);
    on<DeleteProduct>(_onDeleteProduct);
    on<ChangeAdminTab>(_onChangeAdminTab);
  }

  Future<void> _onLoadDashboardStats(
    LoadDashboardStats event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final stats = await adminRepository.getDashboardStats();
      emit(state.copyWith(
        isLoading: false,
        totalUsers: stats['totalUsers'] ?? 0,
        totalProducts: stats['totalProducts'] ?? 0,
        totalOrders: stats['totalOrders'] ?? 0,
        totalRevenue: stats['totalRevenue'] ?? 0.0,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onLoadUsers(
    LoadUsers event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final users = await adminRepository.getAllUsers();
      emit(state.copyWith(
        isLoading: false,
        users: users,
        filteredUsers: users,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void _onSearchUsers(
    SearchUsers event,
    Emitter<AdminState> emit,
  ) {
    final query = event.query.toLowerCase();
    if (query.isEmpty) {
      emit(state.copyWith(filteredUsers: state.users, searchQuery: ''));
    } else {
      final filtered = state.users.where((user) {
        final userName = user.userName?.toLowerCase() ?? '';
        final email = user.email?.toLowerCase() ?? '';
        return userName.contains(query) || email.contains(query);
      }).toList();
      emit(state.copyWith(filteredUsers: filtered, searchQuery: query));
    }
  }

  Future<void> _onBlockUser(
    BlockUser event,
    Emitter<AdminState> emit,
  ) async {
    try {
      await adminRepository.blockUser(event.userId);
      // Reload users after blocking
      add(LoadUsers());
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onUnblockUser(
    UnblockUser event,
    Emitter<AdminState> emit,
  ) async {
    try {
      await adminRepository.unblockUser(event.userId);
      // Reload users after unblocking
      add(LoadUsers());
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final products = await adminRepository.getAllProducts();
      emit(state.copyWith(isLoading: false, products: products));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onDeleteProduct(
    DeleteProduct event,
    Emitter<AdminState> emit,
  ) async {
    try {
      await adminRepository.deleteProduct(event.productId);
      // Reload products after deleting
      add(LoadProducts());
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  void _onChangeAdminTab(
    ChangeAdminTab event,
    Emitter<AdminState> emit,
  ) {
    emit(state.copyWith(currentTabIndex: event.tabIndex));
  }
}
