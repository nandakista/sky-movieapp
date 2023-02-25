import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:skybase/core/themes/app_style.dart';
import 'package:skybase/domain/entities/genre.dart';
import 'package:skybase/ui/widgets/content_wrapper.dart';
import 'package:skybase/ui/widgets/sky_image.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.status,
    required this.overview,
    required this.genres,
    required this.voteAverage,
    required this.voteCount,
    this.runtime,
    this.recommendedView,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String status;
  final String overview;
  final List<Genre> genres;
  final int? runtime;
  final double voteAverage;
  final int voteCount;
  final Widget? recommendedView;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SkyImage(
            url: imageUrl,
            width: MediaQuery.of(context).size.width,
            height: 500,
            fit: BoxFit.cover,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            ),
          ),
          const SizedBox(height: 12),
          ContentWrapper(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: AppStyle.subtitle2,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        status,
                        style: AppStyle.body2.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  _buildGenre(genres),
                  style: AppStyle.body2,
                ),
                const SizedBox(height: 4),
                if(runtime != null) Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.time,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                     Text(
                      _buildDuration(runtime!),
                      style: AppStyle.body2,
                    ),
                  ],
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
                      itemSize: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${voteAverage.toStringAsFixed(1)} / 10',
                      style: AppStyle.body1.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.orange),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '($voteCount)',
                      style: AppStyle.body1.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Overview',
                  style: AppStyle.subtitle4,
                ),
                const Divider(),
                Text(
                  overview,
                  style: AppStyle.body2,
                ),
                const SizedBox(height: 16),
                if(recommendedView != null) recommendedView!,
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _buildGenre(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _buildDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
