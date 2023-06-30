import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:skybase/core/themes/app_style.dart';
import 'package:skybase/ui/widgets/sky_box.dart';
import 'package:skybase/ui/widgets/sky_image.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.title,
    required this.overview,
    required this.imageUrl,
    required this.voteAverage,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String overview;
  final String imageUrl;
  final double voteAverage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SkyBox(
      margin: const EdgeInsets.symmetric(vertical: 4),
      onPressed: onTap,
      child: Row(
        children: [
          SkyImage(
            src: imageUrl,
            width: 80,
            height: 120,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyle.subtitle3,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: voteAverage / 2,
                      itemCount: 5,
                      unratedColor: Colors.orange.withOpacity(0.3),
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      itemSize: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${voteAverage.toStringAsFixed(1)} / 10',
                      style: AppStyle.body3.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.orange),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  (overview.isEmpty)
                      ? 'This TV Series has no overview'
                      : overview,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
