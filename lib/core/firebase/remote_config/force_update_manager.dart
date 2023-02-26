import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:skybase/app_configuration.dart';
import 'package:skybase/core/helper/dialog_helper.dart';
import 'package:store_redirect/store_redirect.dart';

import 'force_update_payload.dart';

class ForceUpdateManager extends GetxService {
  String tag = 'ForceUpdateController::->';

  @override
  void onReady() {
    super.onReady();
    shouldUpdate();
  }

  Future<void> shouldUpdate() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    Map<String, RemoteConfigValue> configs = remoteConfig.getAll();

    debugPrint(
      '$tag ${configs.map((key, value) => MapEntry(key, value.asString()))}',
    );

    final buildNumber = int.tryParse(AppConfiguration.buildNumber) ?? 0;

    final payload = ForceUpdatePayload.fromRcv(configs);
    final minInfo = payload.minInfo;
    final minForce = payload.minForce;

    debugPrint('=============================================');
    debugPrint("$tag Should force update : ");
    debugPrint("buildNumber $buildNumber < minForce $minForce");
    debugPrint("(${buildNumber < minForce})");
    debugPrint('=============================================');
    debugPrint("$tag Should info update : ");
    debugPrint("buildNumber $buildNumber < minInfo $minForce");
    debugPrint("(${buildNumber < minInfo})");
    debugPrint('=============================================');

    if (buildNumber < minForce) {
      SkyDialog.show(
        type: DialogType.FORCE,
        title: 'txt_update_available'.tr,
        confirmText: 'txt_update_now'.tr,
        message: payload.messageInfo,
        onPress: () => openStore(payload),
      );
    } else if (buildNumber < minInfo) {
      SkyDialog.show(
        type: DialogType.WARNING,
        title: 'txt_update_available'.tr,
        confirmText: 'txt_update_now'.tr,
        cancelText: 'txt_later'.tr,
        message: payload.messageForce,
        onPress: () => openStore(payload),
        onCancel: () => Get.back(),
      );
    }
  }

  void openStore(ForceUpdatePayload payload) {
    debugPrint('Open Store');
    StoreRedirect.redirect(
      iOSAppId: payload.appStoreId,
    );
  }
}
