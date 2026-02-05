import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wm_flutter/bloc/admin/admin_bloc.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';

class AdminScaffold extends StatelessWidget {
  final Widget child;
  final String title;

  const AdminScaffold({
    super.key,
    required this.child,
    this.title = 'Admin Dashboard',
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1200;
        final isTablet = constraints.maxWidth >= 768 && constraints.maxWidth < 1200;

        if (isDesktop) {
          return _DesktopLayout(title: title, child: child);
        } else if (isTablet) {
          return _TabletLayout(title: title, child: child);
        } else {
          return _MobileLayout(title: title, child: child);
        }
      },
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  final String title;
  final Widget child;

  const _DesktopLayout({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const AdminSidebar(isExpanded: true),
          Expanded(
            child: Column(
              children: [
                _AdminAppBar(title: title),
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TabletLayout extends StatelessWidget {
  final String title;
  final Widget child;

  const _TabletLayout({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const AdminSidebar(isExpanded: false),
          Expanded(
            child: Column(
              children: [
                _AdminAppBar(title: title),
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  final String title;
  final Widget child;

  const _MobileLayout({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: AppColors.primaryDark,
        foregroundColor: Colors.white,
      ),
      drawer: const Drawer(
        child: AdminSidebar(isExpanded: true, isDrawer: true),
      ),
      body: child,
    );
  }
}

class _AdminAppBar extends StatelessWidget {
  final String title;

  const _AdminAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.darkGreen,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          const CircleAvatar(
            backgroundColor: AppColors.primaryDark,
            child: Icon(Icons.person, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class AdminSidebar extends StatelessWidget {
  final bool isExpanded;
  final bool isDrawer;

  const AdminSidebar({
    super.key,
    this.isExpanded = true,
    this.isDrawer = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = isExpanded ? 260.0 : 72.0;

    return BlocBuilder<AdminBloc, AdminState>(
      builder: (context, state) {
        return Container(
          width: width,
          color: AppColors.darkGreen,
          child: Column(
            children: [
              // Logo/Brand
              Container(
                height: 80,
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: isExpanded
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.store,
                        color: AppColors.darkGreen,
                      ),
                    ),
                    if (isExpanded) ...[
                      const SizedBox(width: 12),
                      const Text(
                        'WeMultiply',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const Divider(color: Colors.white24, height: 1),
              // Navigation Items
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    _NavItem(
                      icon: Icons.dashboard,
                      label: 'Dashboard',
                      isSelected: state.currentTabIndex == 0,
                      isExpanded: isExpanded,
                      onTap: () {
                        context.read<AdminBloc>().add(const ChangeAdminTab(0));
                        if (isDrawer) Navigator.pop(context);
                      },
                    ),
                    _NavItem(
                      icon: Icons.people,
                      label: 'Users',
                      isSelected: state.currentTabIndex == 1,
                      isExpanded: isExpanded,
                      onTap: () {
                        context.read<AdminBloc>().add(const ChangeAdminTab(1));
                        if (isDrawer) Navigator.pop(context);
                      },
                    ),
                    _NavItem(
                      icon: Icons.inventory_2,
                      label: 'Products',
                      isSelected: state.currentTabIndex == 2,
                      isExpanded: isExpanded,
                      onTap: () {
                        context.read<AdminBloc>().add(const ChangeAdminTab(2));
                        if (isDrawer) Navigator.pop(context);
                      },
                    ),
                    _NavItem(
                      icon: Icons.shopping_cart,
                      label: 'Orders',
                      isSelected: state.currentTabIndex == 3,
                      isExpanded: isExpanded,
                      onTap: () {
                        context.read<AdminBloc>().add(const ChangeAdminTab(3));
                        if (isDrawer) Navigator.pop(context);
                      },
                    ),
                    _NavItem(
                      icon: Icons.payments,
                      label: 'Payments',
                      isSelected: state.currentTabIndex == 4,
                      isExpanded: isExpanded,
                      onTap: () {
                        context.read<AdminBloc>().add(const ChangeAdminTab(4));
                        if (isDrawer) Navigator.pop(context);
                      },
                    ),
                    _NavItem(
                      icon: Icons.analytics,
                      label: 'Analytics',
                      isSelected: state.currentTabIndex == 5,
                      isExpanded: isExpanded,
                      onTap: () {
                        context.read<AdminBloc>().add(const ChangeAdminTab(5));
                        if (isDrawer) Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              // Logout
              const Divider(color: Colors.white24, height: 1),
              _NavItem(
                icon: Icons.logout,
                label: 'Logout',
                isSelected: false,
                isExpanded: isExpanded,
                onTap: () {
                  // Implement logout
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final bool isExpanded;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Material(
        color: isSelected ? Colors.white.withValues(alpha: 0.15) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 48,
            padding: EdgeInsets.symmetric(
              horizontal: isExpanded ? 16 : 0,
            ),
            child: Row(
              mainAxisAlignment:
                  isExpanded ? MainAxisAlignment.start : MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: isSelected ? Colors.white : Colors.white70,
                  size: 24,
                ),
                if (isExpanded) ...[
                  const SizedBox(width: 12),
                  Text(
                    label,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white70,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
