import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wm_flutter/bloc/product/product_bloc.dart';
import 'package:wm_flutter/core/constant/core_constant.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';
import 'package:wm_flutter/core/utils/core_utils.dart';
import 'package:wm_flutter/core/utils/format_utils.dart';
import 'package:wm_flutter/views/product_view.dart';
import 'package:wm_flutter/widgets/app_scaffold.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final DateTime dtnow = DateTime.now();
    // final NumberFormat numberFormat = NumberFormat.currency(locale: 'en_US', symbol: '₱');

    // const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
    // final cdnServer = serverUrlFromEnv.isEmpty ? 'http://192.168.1.235:8888' : serverUrlFromEnv;

    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return AppScaffold(
          title: 'weMultiply',
          body: displayProducts(context, orientation),
          selectedIndex: 0,
          orientation: orientation,
        );
      },
    );
  }

  Widget displayProducts(BuildContext context, Orientation orientation) {
    final txtTheme = Theme.of(context).textTheme;
    final CarouselSliderController carouselController =
        CarouselSliderController();
    final cdnServer = CoreConstant.serverCDN;
    log(cdnServer);
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: AppColors.lightGreen,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: false,
              expandedHeight: orientation == Orientation.portrait
                  ? 250.0
                  : 150.0,
              title: Container(
                height: orientation == Orientation.portrait ? 5.h : 10.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage('assets/pngs/logo2.png'),
                  //   fit: BoxFit.contain,
                  // ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Search products...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsetsGeometry.all(14.sp),
                      child: SizedBox(
                        width: 2.h,
                        height: 2.h,
                        child: loadSVGImage('filter.svg'),
                      ),
                    ),
                    filled: true,
                    fillColor: AppColors.lightBackground,
                    // labelStyle: txtTheme.labelLarge?.copyWith(color: AppColors.primaryTextInfo),
                  ),
                  style: txtTheme.labelLarge?.copyWith(
                    color: AppColors.primaryTextInfo,
                  ),
                ),
              ),
              flexibleSpace: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (state is ProductsLoaded) {
                    return FlexibleSpaceBar(
                      centerTitle: true,
                      background: CarouselSlider.builder(
                        itemCount: state.product.length,
                        carouselController: carouselController,
                        itemBuilder: (context, index, realIndex) {
                          final product = state.product[index];
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: product.isActive
                                    ? cacheNetworkImage(
                                        '${cdnServer}api/cdn/download/images/${product.imageName}',
                                        boxFit: BoxFit.cover,
                                      )
                                    // ? Image.network(
                                    //     '${cdnServer}api/cdn/download/images/${product.imageName}',
                                    //     fit: BoxFit.cover,
                                    //   )
                                    : const Icon(
                                        Icons.image_not_supported,
                                        size: 100,
                                      ),
                              ),

                              // Optional gradient overlay for better readability of text
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black38,
                                      Colors.transparent,
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                              ),
                              // Align(
                              //   alignment: Alignment.center,
                              //   child: Text(
                              //     // Show the first product name, or you can use the current carousel index
                              //     state.product.isNotEmpty ? state.product[index].productName : 'weMultiply',
                              //     style: txtTheme.labelSmall?.copyWith(
                              //       color: AppColors.lightGreen,
                              //     ),
                              //   ),
                              // ),
                            ],
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1.0,
                          height: double.infinity,
                          onPageChanged: (index, reason) {
                            // If you want to update the title dynamically with the current product
                            // you can add a local Cubit or setState for currentIndex here.
                          },
                        ),
                      ),
                    );
                  } else if (state is ProductError) {
                    return FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text('Error', style: TextStyle(color: Colors.red)),
                      background: const Icon(Icons.error, size: 100),
                    );
                  } else {
                    return const FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text('No products available'),
                    );
                  }
                },
              ),
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator.adaptive()),
                  );
                } else if (state is ProductsLoaded) {
                  return SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: orientation == Orientation.portrait
                          ? 2
                          : 4,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 0.75,
                    ),
                    delegate: SliverChildBuilderDelegate((
                      BuildContext context,
                      int index,
                    ) {
                      final product = state.product[index];

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ProductView(
                                product: product,
                                cdnHost: cdnServer,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                                child: product.isActive
                                    ? Hero(
                                        tag: product.id!,
                                        child: cacheNetworkImage(
                                          '${cdnServer}api/cdn/download/images/${product.imageName}',
                                          height:
                                              orientation ==
                                                  Orientation.portrait
                                              ? 20.h
                                              : 15.h,
                                          width: double.infinity,
                                          boxFit: BoxFit.contain,
                                        ),
                                        // child: Image.network(
                                        //   '${cdnServer}api/cdn/download/images/${product.imageName}',
                                        //   height: 150,
                                        //   width: double.infinity,
                                        //   fit: BoxFit.contain,
                                        // ),
                                      )
                                    : const Icon(Icons.image_not_supported),
                              ),
                              Expanded(
                                flex: 1,
                                child: GridTileBar(
                                  title: Column(
                                    children: [
                                      Text(
                                        product.productName,
                                        style: txtTheme.labelMedium?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                          color: AppColors.primaryTextTitle,
                                        ),
                                      ),
                                      Text(
                                        FormatUtils.currencyFormatter.format(
                                          product.price,
                                        ),
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: AppColors.darkGreen,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                        alignment: Alignment.centerRight,
                                        onPressed: () async {
                                          showSnackbar(
                                            context,
                                            "Added to cart ${product.productName}",
                                          );
                                        },
                                        icon: Icon(
                                          Icons.shopping_cart_outlined,
                                          size: 18.sp,
                                          color: AppColors.lightBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // subtitle:
                                  // trailing: IconButton(
                                  //   alignment: Alignment.centerRight,
                                  //   onPressed: () {
                                  //     showSnackbar(context, "Added to cart");
                                  //   },
                                  //   icon: Icon(
                                  //     Icons.shopping_cart_outlined,
                                  //     size: 18.sp,
                                  //     color: AppColors.lightBlue,
                                  //   ),
                                  // ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }, childCount: state.product.length),
                  );
                } else if (state is ProductError) {
                  return SliverFillRemaining(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Error: ${state.message}')),
                    ),
                  );
                } else {
                  return const SliverFillRemaining(
                    child: Center(child: Text('No products available')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
