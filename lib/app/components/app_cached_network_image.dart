import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String? url;
  final BoxFit? fit;
  final Color? color;
  final BorderRadius? radius;
  final String? cacheKey;

  const AppCachedNetworkImage({Key? key, this.height, this.width, this.url, this.fit, this.radius, this.cacheKey, this.color}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CachedNetworkImage(
      color: color,
      imageUrl: url ?? "FALLBACK_IMAGE",
      fadeInDuration: const Duration(milliseconds: 100),
      fadeOutDuration: const Duration(milliseconds: 100),
      imageBuilder: (context, imageProvider) {
        return ClipRRect(
          borderRadius: radius ?? BorderRadius.circular(0),
          child: Image(image: imageProvider, fit:fit, height: height, width: width, gaplessPlayback: true, color: color),
        );
      },
      placeholderFadeInDuration: const Duration(milliseconds: 100),
      width: width ?? size.width,
      placeholder: (context, url) {
        return const Center(child: CupertinoActivityIndicator());
      },
      errorWidget: (context, error, _) {
        print(error);
        return Center(child: const CupertinoActivityIndicator());
      },
      height: height,
      fit: fit ?? BoxFit.cover,
    );
  }
}