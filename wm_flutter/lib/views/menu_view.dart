import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wm_flutter/bloc/auth/auth_bloc.dart';
import 'package:wm_flutter/bloc/cart/cart_bloc.dart';
import 'package:wm_flutter/bloc/menu/menu_bloc.dart';
import 'package:wm_flutter/bloc/product/product_bloc.dart';
import 'package:wm_flutter/core/constant/core_constant.dart';
import 'package:wm_flutter/core/spc_core.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';
import 'package:wm_flutter/core/utils/core_utils.dart';
import 'package:wm_flutter/views/cart_view.dart';
import 'package:wm_flutter/views/home_view.dart';
import 'package:wm_flutter/views/login_view.dart';
import 'package:wm_flutter/views/profile_view.dart';
import 'package:wm_flutter/views/submenu_view.dart';
import 'package:wm_flutter/widgets/bottom_nav_bar.dart';
import 'package:wm_flutter/widgets/shimmer_loading.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            final bool isSignedIn = SpcCore.isSignedIn;
            final theme = Theme.of(context);

            return Scaffold(
              extendBody: true,
              body: SafeArea(
                bottom: false,
                child: CustomScrollView(
                  slivers: [
                    // ── HEADER ─────────────────────────────────
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  isSignedIn
                                      ? 'Good ${_greeting()},'
                                      : 'Welcome to',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: AppColors.slate,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  isSignedIn
                                      ? (SpcCore.sessionManager.signedInUser
                                              ?.userName ??
                                          'User')
                                      : 'WeMultiply',
                                  style: theme.textTheme.headlineLarge,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                _IconBtn(
                                  icon: Icons.notifications_outlined,
                                  onTap: () {},
                                  showDot: true,
                                ),
                                const SizedBox(width: 8),
                                if (isSignedIn)
                                  _IconBtn(
                                    icon: Icons.person_outline_rounded,
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const ProfileView(),
                                      ),
                                    ),
                                  )
                                else
                                  _IconBtn(
                                    icon: Icons.login_rounded,
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => LoginView(),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ── SEARCH BAR ─────────────────────────────
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.warmWhite,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: AppColors.mist,
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 16),
                              const Icon(
                                Icons.search_rounded,
                                color: AppColors.silver,
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'Search products, packages...',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: AppColors.silver,
                                  ),
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                margin: const EdgeInsets.only(right: 4),
                                decoration: const BoxDecoration(
                                  color: AppColors.forest,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.tune_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // ── HERO BANNER ────────────────────────────
                    SliverToBoxAdapter(
                      child: BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, state) {
                          if (state is ProductsLoading) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              child: HeroBannerShimmer(),
                            );
                          }
                          if (state is ProductsLoaded &&
                              state.product.isNotEmpty) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
                              child: _HeroBanner(
                                products: state.product,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),

                    // ── MENU COLLECTIONS (PRIMARY) ─────────────
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 24, 20, 14),
                        child: Text(
                          'Our Collections',
                          style: theme.textTheme.headlineSmall,
                        ),
                      ),
                    ),

                    BlocBuilder<MenuBloc, MenuState>(
                      builder: (context, state) {
                        if (state is MenusLoading) {
                          return const SliverToBoxAdapter(
                            child: MenuGridShimmer(),
                          );
                        }
                        if (state is MenusLoaded && state.menus.isNotEmpty) {
                          return SliverPadding(
                            padding:
                                const EdgeInsets.fromLTRB(20, 0, 20, 16),
                            sliver: SliverGrid(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    orientation == Orientation.portrait ? 2 : 4,
                                mainAxisSpacing: 14,
                                crossAxisSpacing: 14,
                                childAspectRatio: 0.82,
                              ),
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  final menu = state.menus[index];
                                  final items = menu.menuItems ?? [];
                                  return AnimationConfiguration.staggeredGrid(
                                    position: index,
                                    columnCount:
                                        orientation == Orientation.portrait
                                            ? 2
                                            : 4,
                                    duration: const Duration(milliseconds: 400),
                                    child: SlideAnimation(
                                      verticalOffset: 30,
                                      child: FadeInAnimation(
                                        child: _MenuCard(
                                          name: menu.menuName,
                                          imageUrl:
                                              '${CoreConstant.cdnFullPath}${menu.menuImagePath}',
                                          itemCount: items.length,
                                          onTap: () {
                                            if (items.isNotEmpty) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      BlocProvider.value(
                                                    value: context
                                                        .read<CartBloc>(),
                                                    child: SubmenuView(
                                                      menuTitle: menu.menuName,
                                                      menuImage:
                                                          menu.menuImagePath,
                                                      submenuItem: items,
                                                      menuState: state,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            } else {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) => HomeView(),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                childCount: state.menus.length,
                              ),
                            ),
                          );
                        }
                        if (state is MenuError) {
                          return SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.all(40),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.cloud_off_rounded,
                                      size: 48,
                                      color: AppColors.silver,
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      'Could not load collections',
                                      style: theme.textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                        return const SliverToBoxAdapter(
                          child: SizedBox.shrink(),
                        );
                      },
                    ),

                    // ── BROWSE ALL PRODUCTS LINK ───────────────
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 4, 20, 120),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => HomeView(),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color: AppColors.pearl,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppColors.mist,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.storefront_rounded,
                                  size: 20,
                                  color: AppColors.forest,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Browse All Products',
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    color: AppColors.forest,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 18,
                                  color: AppColors.forest,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // ── BOTTOM NAV ─────────────────────────────
              bottomNavigationBar: AppBottomNavBar(
                currentIndex: 0,
                onTap: (index) {
                  switch (index) {
                    case 0:
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => HomeView()),
                      );
                    case 3:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider.value(
                            value: context.read<CartBloc>(),
                            child: const CartView(),
                          ),
                        ),
                      );
                    case 4:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              isSignedIn ? const ProfileView() : LoginView(),
                        ),
                      );
                  }
                },
              ),
            );
          },
        );
      },
    );
  }

  String _greeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'morning';
    if (hour < 17) return 'afternoon';
    return 'evening';
  }
}

// ═══════════════════════════════════════════════
// PRIVATE WIDGETS
// ═══════════════════════════════════════════════

class _IconBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool showDot;

  const _IconBtn({
    required this.icon,
    required this.onTap,
    this.showDot = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: AppColors.warmWhite,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.mist),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(icon, size: 22, color: AppColors.graphite),
            if (showDot)
              Positioned(
                top: 11,
                right: 11,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.coral,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.warmWhite, width: 1.5),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Large visual card for menu categories — the primary content
class _MenuCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int itemCount;
  final VoidCallback onTap;

  const _MenuCard({
    required this.name,
    required this.imageUrl,
    required this.itemCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.forest.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Menu image
              cacheNetworkImage(
                imageUrl,
                boxFit: BoxFit.cover,
              ),
              // Gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      AppColors.forest.withValues(alpha: 0.85),
                    ],
                    stops: const [0.3, 1.0],
                  ),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Item count badge
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          itemCount > 0
                              ? '$itemCount ${itemCount == 1 ? 'item' : 'items'}'
                              : 'Coming soon',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    // Menu name + arrow
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_forward_rounded,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeroBanner extends StatefulWidget {
  final List products;

  const _HeroBanner({required this.products});

  @override
  State<_HeroBanner> createState() => _HeroBannerState();
}

class _HeroBannerState extends State<_HeroBanner> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final displayCount =
        widget.products.length > 5 ? 5 : widget.products.length;

    return Column(
      children: [
        SizedBox(
          height: 160,
          child: CarouselSlider.builder(
            itemCount: displayCount,
            itemBuilder: (context, index, realIndex) {
              final product = widget.products[index];
              return Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [AppColors.forest, AppColors.emerald],
                  ),
                ),
                child: Stack(
                  children: [
                    // Decorative circles
                    Positioned(
                      top: -40,
                      right: -30,
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.mint.withValues(alpha: 0.15),
                        ),
                      ),
                    ),
                    // Content
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Text(
                              'FEATURED',
                              style: TextStyle(
                                color: AppColors.goldLight,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.productName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  height: 1.2,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 7,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: const Text(
                                  'Shop Now  →',
                                  style: TextStyle(
                                    color: AppColors.forest,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
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
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1.0,
              height: 160,
              autoPlayInterval: const Duration(seconds: 5),
              onPageChanged: (index, reason) {
                setState(() => _currentIndex = index);
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            displayCount,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: index == _currentIndex ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: index == _currentIndex
                    ? AppColors.forest
                    : AppColors.mist,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
