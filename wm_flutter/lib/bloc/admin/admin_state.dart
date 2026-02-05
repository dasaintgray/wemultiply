part of 'admin_bloc.dart';

@immutable
class AdminState extends Equatable {
  final bool isLoading;
  final String? error;
  final int currentTabIndex;
  final String searchQuery;

  // Dashboard stats
  final int totalUsers;
  final int totalProducts;
  final int totalOrders;
  final double totalRevenue;

  // Users
  final List<UserInfo> users;
  final List<UserInfo> filteredUsers;

  // Products
  final List<Product> products;

  const AdminState({
    this.isLoading = false,
    this.error,
    this.currentTabIndex = 0,
    this.searchQuery = '',
    this.totalUsers = 0,
    this.totalProducts = 0,
    this.totalOrders = 0,
    this.totalRevenue = 0.0,
    this.users = const [],
    this.filteredUsers = const [],
    this.products = const [],
  });

  AdminState copyWith({
    bool? isLoading,
    String? error,
    int? currentTabIndex,
    String? searchQuery,
    int? totalUsers,
    int? totalProducts,
    int? totalOrders,
    double? totalRevenue,
    List<UserInfo>? users,
    List<UserInfo>? filteredUsers,
    List<Product>? products,
  }) {
    return AdminState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      currentTabIndex: currentTabIndex ?? this.currentTabIndex,
      searchQuery: searchQuery ?? this.searchQuery,
      totalUsers: totalUsers ?? this.totalUsers,
      totalProducts: totalProducts ?? this.totalProducts,
      totalOrders: totalOrders ?? this.totalOrders,
      totalRevenue: totalRevenue ?? this.totalRevenue,
      users: users ?? this.users,
      filteredUsers: filteredUsers ?? this.filteredUsers,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        currentTabIndex,
        searchQuery,
        totalUsers,
        totalProducts,
        totalOrders,
        totalRevenue,
        users,
        filteredUsers,
        products,
      ];
}

class AdminInitial extends AdminState {}

class AdminLoading extends AdminState {
  const AdminLoading() : super(isLoading: true);
}

class AdminError extends AdminState {
  final String errorMessage;

  const AdminError(this.errorMessage) : super();

  @override
  List<Object?> get props => [errorMessage, ...super.props];
}
