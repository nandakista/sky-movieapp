import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skybase/core/extension/string_extension.dart';
import 'package:skybase/ui/widgets/media/preview/media_preview_page.dart';

import 'platform_loading_indicator.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class SkyImage extends StatelessWidget {
  final String? src;
  final double? width;
  final double? height;
  final VoidCallback? onTapImage;
  final VoidCallback? onRemoveImage;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;
  final bool enablePreview;
  final BoxFit? emptyOrNullFit;
  final Widget? emptyOrNullView;
  final String? emptyOrNullUrl;
  final bool fromFile;
  final Color? color;
  final String? previewTitle;
  final TextStyle? previewTitleStyle;

  const SkyImage({
    Key? key,
    this.src,
    this.width,
    this.height,
    this.onTapImage,
    this.onRemoveImage,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.enablePreview = false,
    this.emptyOrNullFit,
    this.emptyOrNullView,
    this.emptyOrNullUrl,
    this.fromFile = false,
    this.color,
    this.previewTitle,
    this.previewTitleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (src.isNotNullAndNotEmpty()) {
      return DisplayImage(
        url: src.toString(),
        width: width,
        height: height,
        fit: fit,
        borderRadius: borderRadius,
        enablePreview: enablePreview,
        onTapImage: onTapImage,
        onRemoveImage: onRemoveImage,
        fromFile: fromFile,
        color: color,
        previewTitle: previewTitle,
        previewTitleStyle: previewTitleStyle,
      );
    } else {
      return DisplayImage(
        url: emptyOrNullUrl ?? 'assets/images/img_empty.png',
        width: width,
        height: height,
        fit: emptyOrNullFit ?? BoxFit.contain,
        borderRadius: borderRadius,
        color: color,
        previewTitle: previewTitle,
        previewTitleStyle: previewTitleStyle,
      );
    }
  }
}

class DisplayImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final VoidCallback? onTapImage;
  final VoidCallback? onRemoveImage;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;
  final bool enablePreview;
  final bool fromFile;
  final Color? color;
  final String? previewTitle;
  final TextStyle? previewTitleStyle;

  const DisplayImage({
    Key? key,
    required this.url,
    this.width,
    this.height,
    this.onTapImage,
    this.onRemoveImage,
    this.borderRadius,
    this.fit = BoxFit.fill,
    this.enablePreview = false,
    this.fromFile = false,
    this.color,
    this.previewTitle,
    this.previewTitleStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFromRemote = url.startsWith('http');
    final isSvg = url.endsWith('svg');

    return Stack(
      children: [
        GestureDetector(
          onTap: enablePreview
              ? () => Get.to(
                    MediaPreviewPage(
                      url: url,
                      fromFile: fromFile,
                      title: previewTitle,
                      titleStyle: previewTitleStyle,
                    ),
                  )
              : onTapImage,
          child: isFromRemote
              ? ClipRRect(
                  borderRadius: borderRadius ?? BorderRadius.circular(0),
                  child: CachedNetworkImage(
                    imageUrl: url,
                    fit: fit,
                    width: width,
                    height: height,
                    placeholder: (context, url) => SizedBox(
                      height: height,
                      width: width,
                      child: const Center(
                        child: PlatformLoadingIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => SizedBox(
                      height: height,
                      width: width,
                      child: const Icon(
                        Icons.error,
                      ),
                    ),
                  ),
                )
              : (isSvg)
                  ? SvgPicture.asset(
                      url,
                      width: width,
                      height: height,
                      colorFilter: color != null
                          ? ColorFilter.mode(color!, BlendMode.srcIn)
                          : null,
                      fit: fit,
                    )
                  : (fromFile)
                      ? ClipRRect(
                          borderRadius:
                              borderRadius ?? BorderRadius.circular(0),
                          child: Image.file(
                            File(url),
                            width: width,
                            height: height,
                            fit: fit,
                          ),
                        )
                      : ClipRRect(
                          borderRadius:
                              borderRadius ?? BorderRadius.circular(0),
                          child: Image.asset(
                            url,
                            width: width,
                            height: height,
                            fit: fit,
                          ),
                        ),
        ),
        onRemoveImage != null
            ? Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: onRemoveImage,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
