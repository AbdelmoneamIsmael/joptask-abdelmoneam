import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:tasky_abdelmoneam/core/utils/generator/app_images.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.url,
    this.errorWidget,
    this.fit,
  });
  final String url;
  final Widget? errorWidget;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit ?? BoxFit.cover,
      imageUrl: url,
      placeholder: (context, url) {
        return BlurHash(
          hash: 'LKO2:N%2Tw=w]~RBVZRi};RPxuwH',
          imageFit: fit ?? BoxFit.fill,
        );
      },
      errorWidget: (context, url, error) =>
          errorWidget ?? Image.asset(AppImages.defaultTaskImage),
    );
  }
}
