import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CoverItem extends StatelessWidget {
  const CoverItem({
    Key? key,
    this.height,
    required this.onTap,
    required this.imageUrl,
  }) : super(key: key);

  final double? height;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
