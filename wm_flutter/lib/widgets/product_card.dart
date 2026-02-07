import 'package:flutter/material.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';
import 'package:wm_flutter/core/utils/core_utils.dart';
import 'package:wm_flutter/core/utils/format_utils.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String? imageUrl;
  final bool isActive;
  final String? tag; // "New", "Hot", "-20%"
  final VoidCallback? onTap;
  final VoidCallback? onAddToCart;
  final int? heroTagId;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    this.imageUrl,
    this.isActive = true,
    this.tag,
    this.onTap,
    this.onAddToCart,
    this.heroTagId,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.warmWhite,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black.withValues(alpha: 0.03)),
          boxShadow: [
            BoxShadow(
              color: AppColors.forest.withValues(alpha: 0.06),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image area
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  // Product image
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.pearl,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      child: isActive && imageUrl != null
                          ? heroTagId != null
                              ? Hero(
                                  tag: heroTagId!,
                                  child: cacheNetworkImage(
                                    imageUrl!,
                                    boxFit: BoxFit.cover,
                                  ),
                                )
                              : cacheNetworkImage(
                                  imageUrl!,
                                  boxFit: BoxFit.cover,
                                )
                          : Center(
                              child: Icon(
                                Icons.image_outlined,
                                size: 40,
                                color: AppColors.silver,
                              ),
                            ),
                    ),
                  ),
                  // Tag badge
                  if (tag != null)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _tagColor(tag!),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Text(
                          tag!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ),
                  // Wishlist button
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.85),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.favorite_border_rounded,
                          size: 16,
                          color: AppColors.graphite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Info area
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product name
                    Text(
                      name,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontSize: 13,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    // Rating placeholder
                    Row(
                      children: [
                        ...List.generate(
                          5,
                          (i) => Icon(
                            Icons.star_rounded,
                            size: 12,
                            color: i < 4 ? AppColors.gold : AppColors.mist,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(4.0)',
                          style: theme.textTheme.labelSmall?.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Price + Add button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            FormatUtils.currencyFormatter.format(price),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.forest,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        GestureDetector(
                          onTap: onAddToCart,
                          child: Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              color: AppColors.forest,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add_rounded,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _tagColor(String tag) {
    final t = tag.toLowerCase();
    if (t.contains('new')) return AppColors.emerald;
    if (t.contains('hot') || t.contains('best')) return AppColors.gold;
    if (t.contains('%') || t.contains('sale')) return AppColors.coral;
    return AppColors.emerald;
  }
}
