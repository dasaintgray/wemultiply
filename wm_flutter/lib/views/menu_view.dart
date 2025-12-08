import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wm_flutter/bloc/auth/auth_bloc.dart';
import 'package:wm_flutter/bloc/cart/cart_bloc.dart';
import 'package:wm_flutter/bloc/menu/menu_bloc.dart';
import 'package:wm_flutter/core/constant/core_constant.dart';
import 'package:wm_flutter/core/extensions/core_extensions.dart';
import 'package:wm_flutter/core/spc_core.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';
import 'package:wm_flutter/core/utils/core_utils.dart';
import 'package:wm_flutter/views/home_view.dart';
import 'package:wm_flutter/views/login_view.dart';
import 'package:wm_flutter/views/profile_view.dart';

import 'package:wm_flutter/views/submenu_view.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            final bool isSignedIn = SpcCore.isSignedIn;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.lightBackground,
                elevation: 0,
                actions: [
                  if (isSignedIn)
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ProfileView(),
                            ),
                          );
                        },
                        icon: const CircleAvatar(
                          backgroundColor: AppColors.darkGreen,
                          radius: 16,
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    )
                  else
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => LoginView()),
                        );
                      },
                      icon: const Icon(Icons.login, color: AppColors.darkGreen),
                      label: const Text(
                        'Sign In',
                        style: TextStyle(color: AppColors.darkGreen),
                      ),
                    ),
                ],
              ),
              body: SafeArea(
                child: BlocBuilder<MenuBloc, MenuState>(
                  builder: (context, state) {
                    if (state is MenusLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is MenuError) {
                      return Center(
                        child: Text(
                          'Error: ${state.message}',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.redAccent,
                          ),
                        ),
                      );
                    }

                    if (state is MenusLoaded && state.menus.isNotEmpty) {
                      return Column(
                        children: [
                          // App Logo
                          Center(
                            child: loadAssetImage(
                              CoreConstant.logoWithText,
                              width: 50.w,
                              height: 40.w,
                              boxFit: BoxFit.contain,
                            ),
                          ),

                          // Menu List
                          Expanded(
                            flex: 5,
                            child: ListView.separated(
                              padding: EdgeInsets.symmetric(
                                horizontal: 5.w,
                                vertical: 2.h,
                              ),
                              separatorBuilder: (_, _) =>
                                  SizedBox(height: 1.5.h),
                              itemCount: state.menus.length,
                              itemBuilder: (context, index) {
                                final menu = state.menus[index];
                                final items = menu.menuItems ?? [];
                                final hasItems = items.isNotEmpty;

                                return GestureDetector(
                                  onTap: () {
                                    if (hasItems) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => BlocProvider.value(
                                            value: context.read<CartBloc>(),
                                            child: SubmenuView(
                                              menuTitle: menu.menuName,
                                              menuImage: menu.menuImagePath,
                                              submenuItem: items,
                                              menuState: state,
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      // showSnackbar(context, 'No items available for this menu.');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => HomeView(),
                                        ),
                                      );
                                    }
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeInOut,
                                    padding: EdgeInsets.all(3.w),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(
                                        alpha: 0.9,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          // child: cacheNetworkImage(
                                          //   '${CoreConstant.cdnFullPath}${menu.menuImagePath}',
                                          //   height: 15.h,
                                          //   width: 20.w,
                                          //   boxFit: BoxFit.cover,
                                          // ),
                                          child: loadAssetImage(
                                            menu.menuImagePath,
                                            width: 20.w,
                                            height: 20.w,
                                            boxFit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(width: 4.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                menu.menuName,
                                                style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                              SizedBox(height: 0.5.h),
                                              Text(
                                                hasItems
                                                    ? '${items.length} item${items.length > 1 ? 's' : ''}'
                                                    : 'No items available',
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: hasItems
                                                      ? Colors.grey[700]
                                                      : Colors.grey[500],
                                                  fontStyle: hasItems
                                                      ? FontStyle.normal
                                                      : FontStyle.italic,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Icon(
                                          Icons.chevron_right,
                                          color: Colors.black45,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    }

                    // Fallback (no menus)
                    return const Center(child: Text('No menus available.'));
                  },
                ),
              ).backgroundColor(AppColors.lightBackground),
            );
          },
        );
      },
    );
  }
}
