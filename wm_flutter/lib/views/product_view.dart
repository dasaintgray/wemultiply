import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wm_client/wm_client.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';
import 'package:wm_flutter/core/utils/format_utils.dart';

class ProductView extends StatelessWidget {
  final Product product;
  final String cdnHost;
  const ProductView({super.key, required this.product, required this.cdnHost});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, devicetype) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                elevation: 0,
                pinned: true,
                title: Text(
                  product.productName,
                  style: TextTheme.of(context).labelLarge?.copyWith(
                    color: AppColors.lightBackground,
                    fontSize: 18,
                  ),
                ),
                leading: Ink(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: AppColors.darkBackground,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 2.h,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: product.isActive
                            ? Hero(
                                tag: product.id!,
                                child: Image.network(
                                  '${cdnHost}api/cdn/download/images/${product.imageName}',
                                  height: 40.h,
                                  width: double.infinity,
                                  fit: BoxFit.contain,
                                ),
                              )
                            : const Icon(Icons.image_not_supported),
                      ),
                      Text(
                        FormatUtils.currencyFormatter.format(product.price),
                        style: TextTheme.of(context).bodyLarge?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        product.productName,
                        style: TextTheme.of(
                          context,
                        ).labelLarge?.copyWith(color: AppColors.darkGreen),
                      ),
                      Text(
                        product.description,
                        style: TextTheme.of(context).bodySmall?.copyWith(),
                      ),
                      Text(
                        product.isActive ? 'In Stock' : 'Out of Stock',
                        style: TextTheme.of(context).labelLarge?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: product.isActive ? Colors.green : Colors.red,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {},
                        label: const Text('Add to Cart'),
                        icon: const Icon(Icons.add_shopping_cart),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkGreen,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
