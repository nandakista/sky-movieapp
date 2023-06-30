import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/core/themes/app_colors.dart';
import 'package:skybase/core/themes/app_style.dart';
import 'package:skybase/ui/widgets/base/base_appbar.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
abstract class SkyAppBar {
  /// Use [SkyAppBar.primary] as a default AppBar globally.
  /// * Can edited for specific requirement.
  static PreferredSizeWidget primary({
    String? title,
    Color? backgroundColor,
    Color? iconColor,
    List<Widget>? action,
    bool? centerTitle = false,
    TextStyle? titleStyle,
  }) {
    return BaseAppBar(
      title: title,
      action: action,
      backgroundColor: Theme.of(Get.context!).scaffoldBackgroundColor,
      titleStyle: titleStyle ?? AppStyle.subtitle4.copyWith(color: AppColors.primary),
      elevation: 0,
      iconColor: iconColor ?? AppColors.systemDarkGrey,
      centerTitle: centerTitle,
    );
  }

  /// Use [SkyAppBar.secondary] as an secondary AppBar for some pages.
  /// * Can edited for specific requirement.
  static PreferredSizeWidget secondary({
    String? title,
    Color? backgroundColor,
    Color? textColor,
    Color? iconColor,
    VoidCallback? onPressed,
    List<Widget>? action,
    bool? centerTitle,
  }) {
    return BaseAppBar(
      title: title,
      centerTitle: true,
      action: action,
      backgroundColor: backgroundColor,
      titleStyle: TextStyle(color: textColor),
      iconColor: Colors.white,
    );
  }

///
/// Add other AppBar if needed.
///
}