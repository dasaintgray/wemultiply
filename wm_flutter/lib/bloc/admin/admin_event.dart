part of 'admin_bloc.dart';

@immutable
sealed class AdminEvent extends Equatable {
  const AdminEvent();

  @override
  List<Object?> get props => [];
}

// Dashboard Events
class LoadDashboardStats extends AdminEvent {}

// User Management Events
class LoadUsers extends AdminEvent {}

class SearchUsers extends AdminEvent {
  final String query;

  const SearchUsers(this.query);

  @override
  List<Object?> get props => [query];
}

class BlockUser extends AdminEvent {
  final int userId;

  const BlockUser(this.userId);

  @override
  List<Object?> get props => [userId];
}

class UnblockUser extends AdminEvent {
  final int userId;

  const UnblockUser(this.userId);

  @override
  List<Object?> get props => [userId];
}

// Product Management Events
class LoadProducts extends AdminEvent {}

class DeleteProduct extends AdminEvent {
  final int productId;

  const DeleteProduct(this.productId);

  @override
  List<Object?> get props => [productId];
}

// Navigation Events
class ChangeAdminTab extends AdminEvent {
  final int tabIndex;

  const ChangeAdminTab(this.tabIndex);

  @override
  List<Object?> get props => [tabIndex];
}
