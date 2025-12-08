import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wm_client/wm_client.dart';
import 'package:wm_flutter/bloc/menu/menu_bloc.dart';
import 'package:wm_flutter/bloc/product/product_bloc.dart';
import 'package:wm_flutter/core/constant/core_constant.dart';
import 'package:wm_flutter/core/extensions/core_extensions.dart';
import 'package:wm_flutter/core/repositories/product_repository.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';
import 'package:wm_flutter/core/utils/core_utils.dart';
import 'package:wm_flutter/views/sm_package_details_view.dart';

class SubmenuView extends StatelessWidget {
  final String menuTitle;
  final String menuImage;
  final List<MenuItems> submenuItem;
  final MenuState menuState;

  const SubmenuView({
    super.key,
    required this.menuTitle,
    required this.menuImage,
    required this.submenuItem,
    required this.menuState,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              menuTitle,
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
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header image
                Container(
                  margin: EdgeInsets.symmetric(vertical: 2.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: loadAssetImage(
                      menuImage.isNotEmpty
                          ? menuImage
                          : CoreConstant.defaultLogo,
                      width: 30.w,
                      height: 30.w,
                      boxFit: BoxFit.cover,
                    ),
                  ),
                ),

                Text(
                  '$menuTitle details',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryTextTitle,
                  ),
                ),

                // Subtitle / Info section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Text(
                    'Explore the available options below.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                  ),
                ),
                SizedBox(height: 2.h),

                // Submenu list
                Expanded(
                  child: submenuItem.isNotEmpty
                      ? ListView.separated(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5.w,
                            vertical: 1.h,
                          ),
                          separatorBuilder: (_, _) => SizedBox(height: 1.2.h),
                          itemCount: submenuItem.length,
                          itemBuilder: (context, index) {
                            final item = submenuItem[index];
                            //kung walang makita sa product default ang gamitin
                            return GestureDetector(
                              child: BlocProvider(
                                create: (context) => ProductBloc(
                                  productRepository: context
                                      .read<ProductRepository>(),
                                )..add(LoadProductById(item.productID)),
                                child: BlocBuilder<ProductBloc, ProductState>(
                                  builder: (prodContext, productState) {
                                    // log(productState.toString());
                                    if (productState is ProductsLoading) {
                                      return CircularProgressIndicator.adaptive()
                                          .center();
                                    }
                                    if (productState is ProductLoaded) {
                                      final prod = productState.product;
                                      return _SubmenuCard(
                                        // product: prod,
                                        productName: prod.productName,
                                        imageName: prod.imageName,
                                        productPrice: prod.price,
                                        productTitle: item.menuItemDesc,
                                        isActive: prod.isActive,
                                      );
                                    }

                                    return _SubmenuCard(
                                      // product: prod,
                                      productName: item.menuItemDesc,
                                      imageName: item.menuItemImage,
                                      productPrice: item.price,
                                      productTitle: item.menuItemDesc,
                                      isActive: item.isActive,
                                    );
                                  },
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        SmPackageDetailsView(submenuItem: item),
                                  ),
                                );
                              },
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            'No items found for this menu.',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey[600],
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// -----------------------------------------------------------------------------
// 🧩 SubmenuCard Widget – Clean, animated item layout
// -----------------------------------------------------------------------------
class _SubmenuCard extends StatelessWidget {
  // final MenuItems item;
  // final Product product;
  final String productTitle;
  final String imageName;
  final String productName;
  final double productPrice;
  final bool isActive;
  const _SubmenuCard({
    // required this.product,
    required this.productTitle,
    required this.imageName,
    required this.productName,
    required this.productPrice,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(16),
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
          // Thumbnail (optional)
          if (isActive)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: cacheNetworkImage(
                '${CoreConstant.cdnFullPath}$imageName',
                width: 16.w,
                height: 16.w,
                boxFit: BoxFit.cover,
              ),
              // child: loadAssetImage(
              //   product.isActive ? CoreConstant.defaultLogo : product.imageName,
              //   width: 16.w,
              //   height: 16.w,
              //   boxFit: BoxFit.cover,
              // ),
            )
          else
            Icon(
              Icons.fastfood_rounded,
              size: 16.w,
              color: AppColors.darkGreen.withValues(alpha: 0.5),
            ),

          SizedBox(width: 4.w),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productTitle,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryTextTitle,
                  ),
                ),
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryTextTitle,
                  ),
                ),
                SizedBox(height: 0.5.h),
                // Price Tag
                Text(
                  '$productPrice'.perangPinoy,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkGreen,
                  ),
                ),
              ],
            ),
          ),

          IconButton(onPressed: () {}, icon: Icon(Icons.shop)),
        ],
      ),
    );
  }
}
