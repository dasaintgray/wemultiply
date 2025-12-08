import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wm_flutter/core/extensions/core_extensions.dart';
import 'package:wm_flutter/core/styles/color_styles.dart';

Widget loadSVGImage(
  String image, {
  double? width,
  double? height,
  Color? color,
  BoxFit boxFit = BoxFit.contain,
}) {
  return SvgPicture.asset(
    'assets/svgs/$image',
    colorFilter: color != null
        ? ColorFilter.mode(color, BlendMode.srcIn)
        : null,
    width: width ?? 15.h,
    height: height ?? 15.h,
    fit: boxFit,
  );
}

Widget loadNetworkImage(
  String imageUrl, {
  double? width,
  double? height,
  BoxFit boxFit = BoxFit.contain,
}) {
  return Image.network(
    imageUrl,
    width: width ?? 15.h,
    height: height ?? 15.h,
    fit: boxFit,
    errorBuilder: (context, error, stackTrace) {
      return const Icon(Icons.broken_image);
    },
    loadingBuilder: (context, child, loadingProgress) {
      if (loadingProgress == null) return child;
      return Center(
        child: CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                    (loadingProgress.expectedTotalBytes ?? 1)
              : null,
        ),
      );
    },
  );
}

Widget cacheNetworkImage(
  String imageUrl, {
  double? width,
  double? height,
  BoxFit boxFit = BoxFit.contain,
}) {
  // Placeholder for cached network image implementation
  // In a real application, you would use a package like 'cached_network_image'
  return CachedNetworkImage(
    imageUrl: imageUrl,
    width: width ?? 20.h,
    height: height ?? 15.h,
    progressIndicatorBuilder: (context, url, downloadProgress) => Text(
      downloadProgress.progress != null
          ? '${(downloadProgress.progress! * 100).toStringAsFixed(0)}%'
          : 'Loading...',
    ).center(),

    // CircularProgressIndicator(value: downloadProgress.progress),
    errorWidget: (context, url, error) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.error, color: AppColors.dangerColor, size: 20.sp),
          Text(
            'Failed to load image',
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.dangerColor,
              overflow: TextOverflow.ellipsis,
            ),
          ).center(),
        ],
      );
    },
  );
}

Widget loadAssetImage(
  String image, {
  double? width,
  double? height,
  BoxFit boxFit = BoxFit.contain,
}) {
  return Image.asset(
    'assets/pngs/$image',
    width: width ?? 30.w,
    height: height ?? 35.h,
    fit: boxFit,
  );
}

Widget showSnackbar(
  BuildContext context,
  String message, {
  Duration duration = const Duration(seconds: 3),
}) {
  final snackBar = SnackBar(content: Text(message), duration: duration);
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
  return const SizedBox.shrink();
}
