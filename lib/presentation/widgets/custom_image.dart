import 'package:flutter/widgets.dart';
import 'package:weather_app/core/constants/app_images.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.src,
    this.width,
    this.height,
    this.fit,
  });

  final String src;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          AppImages.brokenImage,
          width: width,
          height: height,
          fit: fit,
        );
      },
    );
  }
}
