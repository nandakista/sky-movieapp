import 'package:flutter/material.dart';
import 'package:skybase/core/helper/media_helper.dart';
import 'package:skybase/ui/widgets/media/preview/components/video_preview_display.dart';
import 'package:skybase/ui/widgets/sky_appbar.dart';
import 'package:skybase/ui/widgets/sky_image.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class MediaPreviewPage extends StatelessWidget {
  final String url;
  final bool isAsset;
  final String? title;
  final TextStyle? titleStyle;

  const MediaPreviewPage({
    Key? key,
    required this.url,
    this.isAsset = true,
    this.title,
    this.titleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SkyAppBar.primary(
          title: title ?? 'Media Preview',
          titleStyle: titleStyle,
        ),
        body: _determineMedia(url));
  }

  Widget _determineMedia(String path) {
    final mediaType = MediaHelper.getMediaType(path);
    switch (mediaType.type) {
      case MediaType.file:
        return const Center(child: Text('Media Unsupported'));
      case MediaType.image:
        return Center(
          child: SkyImage(
            src: mediaType.path,
            isAsset: isAsset,
          ),
        );
      case MediaType.video:
        return VideoPreviewDisplay(
          url: mediaType.path,
          height: double.infinity,
          width: double.infinity,
        );
      case MediaType.unknown:
        return const Center(child: Text('Media Unsupported'));
    }
  }
}
