import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wm_client/wm_client.dart';
import 'package:wm_flutter/bloc/cart/cart_bloc.dart';
import 'package:wm_flutter/bloc/product/product_bloc.dart';
import 'package:wm_flutter/core/constant/core_constant.dart';
import 'package:wm_flutter/core/extensions/core_extensions.dart';
import 'package:wm_flutter/core/repositories/product_repository.dart';
import 'package:wm_flutter/core/spc_core.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';
import 'package:wm_flutter/core/utils/core_utils.dart';
import 'package:wm_flutter/views/login_view.dart';
import 'package:wm_flutter/views/payment_view.dart';
import 'package:wm_flutter/widgets/floating_cart_button.dart';

class SmPackageDetailsView extends StatelessWidget {
  final MenuItems submenuItem;

  const SmPackageDetailsView({super.key, required this.submenuItem});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              submenuItem.menuItemDesc,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
                color: AppColors.primaryTextTitle,
              ),
            ),
            backgroundColor: AppColors.lightBackground,
            elevation: 0,
            iconTheme: IconThemeData(color: AppColors.primaryTextTitle),
          ),
          floatingActionButton: const FloatingCartButtonSmall(),
          body: SafeArea(
            child: BlocProvider(
              create: (context) => ProductBloc(
                productRepository: context.read<ProductRepository>(),
              )..add(LoadProductById(submenuItem.productID)),
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ProductError) {
                    return Center(
                      child: Column(
                        children: [
                          Text(
                            'Kindly message or email with the screenshot of error \n@ wemultiplymobile@gmail.com.\nThank you.',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.dangerColor,
                            ),
                          ).paddingAll(16.sp),
                          Text(
                            'Error: ${state.message}',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.redAccent,
                            ),
                          ).paddingAll(16.sp),
                        ],
                      ),
                    );
                  }

                  if (state is ProductLoaded) {
                    final product = state.product;
                    log('${CoreConstant.cdnFullPath}${product.imageName}');
                    return Column(
                      children: [
                        InteractiveViewer(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: !product.imageName.isNotEmpty
                                ? loadAssetImage(
                                    submenuItem.menuItemImage.isNotEmpty
                                        ? submenuItem.menuItemImage
                                        : CoreConstant.defaultLogo,
                                    // width: 30.w,
                                    height: 30.h,
                                    boxFit: BoxFit.cover,
                                  )
                                : cacheNetworkImage(
                                    '${CoreConstant.cdnFullPath}${product.imageName}',
                                    height: 30.h,
                                    // width: 30.w,
                                  ),
                          ).center(),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '${submenuItem.price}'.perangPinoy,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                              Text(
                                submenuItem.productDesc,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryTextTitle,
                                ),
                              ),
                              Text(
                                product.description,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.primaryTextTitle,
                                ),
                              ).paddingAll(16.sp),
                            ],
                          ),
                        ),
                        // SizedBox(height: 2.h),
                        Row(
                          spacing: 2.w,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                final isSignedIn =
                                    SpcCore.sessionManager.isSignedIn;

                                if (isSignedIn) {
                                  // Generate unique order ID
                                  final orderId = 'PKG-${product.id}-${DateTime.now().millisecondsSinceEpoch}';

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => PaymentView(
                                        orderId: orderId,
                                        amount: submenuItem.price.toDouble(),
                                        description: '${submenuItem.productDesc} - ${product.productName}',
                                      ),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => LoginView(),
                                    ),
                                  );
                                }

                                // final authState = context.read<AuthBloc>().state;

                                // if (authState is Authenticated) {
                                //   final prodState = context.read<ProductBloc>().state;

                                //   if (prodState is ProductLoaded) {
                                //     final product = prodState.product;
                                //     final cartBloc = context.read<CartBloc>();

                                //     //step1
                                //     cartBloc.add(
                                //       AddItemToCart(product, 1),
                                //     );
                                //   }
                                // } else {
                                //   // SignInWithEmailButton(
                                //   //   caller: SpcCore.client.modules.auth,
                                //   //   onSignedIn: () {
                                //   //     log('User is signin');
                                //   //   },
                                //   // );
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(builder: (_) => LoginView()),
                                //   );
                                // }
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: AppColors.lightBackground,
                                backgroundColor: AppColors.brandColor,
                                minimumSize: const Size(100, 50),
                                elevation: 1,
                              ),
                              child: Text(
                                'Buy Now',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                final isSignedIn =
                                    SpcCore.sessionManager.isSignedIn;

                                if (isSignedIn) {
                                  context.read<CartBloc>().add(
                                        AddItemToCart(product, 1),
                                      );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        '${product.productName} added to cart',
                                      ),
                                      backgroundColor: AppColors.darkGreen,
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => LoginView(),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: AppColors.lightBackground,
                                backgroundColor: AppColors.darkGreen,
                                minimumSize: const Size(100, 50),
                                elevation: 1,
                              ),
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ).paddingAll(16.sp),
                      ],
                    );
                  }

                  return const Center(
                    child: Text('No product data available.'),
                  );
                },
              ),
            ),
          ).backgroundColor(AppColors.lightBackground),
        );
      },
    );
  }
}
