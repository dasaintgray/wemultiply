import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wm_flutter/bloc/admin/admin_bloc.dart';
import 'package:wm_flutter/core/repositories/admin_repository.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';
import 'package:wm_flutter/widgets/admin/admin_scaffold.dart';
import 'package:wm_flutter/widgets/admin/stats_card.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminBloc(adminRepository: AdminRepository())
        ..add(LoadDashboardStats())
        ..add(LoadUsers())
        ..add(LoadProducts()),
      child: const _AdminDashboardContent(),
    );
  }
}

class _AdminDashboardContent extends StatelessWidget {
  const _AdminDashboardContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminBloc, AdminState>(
      builder: (context, state) {
        return AdminScaffold(
          title: _getTitle(state.currentTabIndex),
          child: _buildContent(context, state),
        );
      },
    );
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return 'Dashboard';
      case 1:
        return 'User Management';
      case 2:
        return 'Product Management';
      case 3:
        return 'Orders';
      case 4:
        return 'Payments';
      case 5:
        return 'Analytics';
      default:
        return 'Dashboard';
    }
  }

  Widget _buildContent(BuildContext context, AdminState state) {
    switch (state.currentTabIndex) {
      case 0:
        return _DashboardHome(state: state);
      case 1:
        return _UserManagement(state: state);
      case 2:
        return _ProductManagement(state: state);
      case 3:
        return const _OrdersView();
      case 4:
        return const _PaymentsView();
      case 5:
        return const _AnalyticsView();
      default:
        return _DashboardHome(state: state);
    }
  }
}

class _DashboardHome extends StatelessWidget {
  final AdminState state;

  const _DashboardHome({required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Overview',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth > 1200
                  ? 4
                  : constraints.maxWidth > 800
                      ? 2
                      : 1;
              final childAspectRatio = constraints.maxWidth > 600 ? 1.8 : 1.5;

              return GridView.count(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: childAspectRatio,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  StatsCard(
                    title: 'Total Users',
                    value: state.totalUsers.toString(),
                    icon: Icons.people,
                    iconColor: AppColors.darkBlue,
                    percentageChange: 12.5,
                  ),
                  StatsCard(
                    title: 'Total Products',
                    value: state.totalProducts.toString(),
                    icon: Icons.inventory_2,
                    iconColor: AppColors.darkGreen,
                    percentageChange: 8.2,
                  ),
                  StatsCard(
                    title: 'Total Orders',
                    value: state.totalOrders.toString(),
                    icon: Icons.shopping_cart,
                    iconColor: Colors.orange,
                    percentageChange: -3.1,
                  ),
                  StatsCard(
                    title: 'Revenue',
                    value: '₱${state.totalRevenue.toStringAsFixed(2)}',
                    icon: Icons.attach_money,
                    iconColor: Colors.purple,
                    percentageChange: 15.7,
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 32),
          const Text(
            'Recent Activity',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(40),
                child: Text(
                  'No recent activity to display',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserManagement extends StatelessWidget {
  final AdminState state;

  const _UserManagement({required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search users...',
                border: InputBorder.none,
                icon: Icon(Icons.search),
              ),
              onChanged: (value) {
                context.read<AdminBloc>().add(SearchUsers(value));
              },
            ),
          ),
          const SizedBox(height: 20),
          // Users table
          Expanded(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: state.filteredUsers.isEmpty
                        ? const Center(
                            child: Text('No users found'),
                          )
                        : ListView.separated(
                            itemCount: state.filteredUsers.length,
                            separatorBuilder: (_, _) => const Divider(height: 1),
                            itemBuilder: (context, index) {
                              final user = state.filteredUsers[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: AppColors.primaryDark,
                                  child: Text(
                                    (user.userName ?? 'U')[0].toUpperCase(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                title: Text(user.userName ?? 'Unknown'),
                                subtitle: Text(user.email ?? ''),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (user.blocked == true)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.red.shade100,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: const Text(
                                          'Blocked',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    PopupMenuButton(
                                      itemBuilder: (context) => [
                                        PopupMenuItem(
                                          child: Text(
                                            user.blocked == true
                                                ? 'Unblock User'
                                                : 'Block User',
                                          ),
                                          onTap: () {
                                            if (user.blocked == true) {
                                              context.read<AdminBloc>().add(
                                                    UnblockUser(user.id!),
                                                  );
                                            } else {
                                              context.read<AdminBloc>().add(
                                                    BlockUser(user.id!),
                                                  );
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _ProductManagement extends StatelessWidget {
  final AdminState state;

  const _ProductManagement({required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add product button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Open add product dialog
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Product'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryDark,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Products grid
          Expanded(
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : state.products.isEmpty
                    ? const Center(child: Text('No products found'))
                    : LayoutBuilder(
                        builder: (context, constraints) {
                          final crossAxisCount = constraints.maxWidth > 1200
                              ? 4
                              : constraints.maxWidth > 800
                                  ? 3
                                  : constraints.maxWidth > 500
                                      ? 2
                                      : 1;

                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.85,
                            ),
                            itemCount: state.products.length,
                            itemBuilder: (context, index) {
                              final product = state.products[index];
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.05),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Product image placeholder
                                    Container(
                                      height: 120,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(12),
                                        ),
                                      ),
                                      child: Center(
                                        child: product.imageURL.isNotEmpty
                                            ? Image.network(
                                                product.imageURL,
                                                fit: BoxFit.cover,
                                                errorBuilder: (_, _, _) =>
                                                    const Icon(
                                                  Icons.image,
                                                  size: 48,
                                                  color: Colors.grey,
                                                ),
                                              )
                                            : const Icon(
                                                Icons.image,
                                                size: 48,
                                                color: Colors.grey,
                                              ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            product.productName,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            '₱${product.price.toStringAsFixed(2)}',
                                            style: const TextStyle(
                                              color: AppColors.primaryDark,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.edit,
                                                  size: 20,
                                                ),
                                                onPressed: () {
                                                  // Edit product
                                                },
                                                padding: EdgeInsets.zero,
                                                constraints:
                                                    const BoxConstraints(),
                                              ),
                                              const SizedBox(width: 8),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.delete,
                                                  size: 20,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () {
                                                  _showDeleteDialog(
                                                    context,
                                                    product.id!,
                                                  );
                                                },
                                                padding: EdgeInsets.zero,
                                                constraints:
                                                    const BoxConstraints(),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, int productId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Product'),
        content: const Text('Are you sure you want to delete this product?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AdminBloc>().add(DeleteProduct(productId));
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

class _OrdersView extends StatelessWidget {
  const _OrdersView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Orders Management',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Coming soon...',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class _PaymentsView extends StatelessWidget {
  const _PaymentsView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.payments, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Payments Management',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Coming soon...',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class _AnalyticsView extends StatelessWidget {
  const _AnalyticsView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.analytics, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Analytics Dashboard',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Coming soon...',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
