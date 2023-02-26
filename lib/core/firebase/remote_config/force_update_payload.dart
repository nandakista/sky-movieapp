import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class ForceUpdatePayload {
  ForceUpdatePayload({
    required this.minInfoAndroid,
    required this.minInfoIos,
    required this.minForceAndroid,
    required this.minForceIos,
    required this.messageForce,
    required this.messageInfo,
    required this.appStoreId,
    required this.appStoreLink,
  });

  final int minInfoAndroid;
  final int minInfoIos;
  final int minForceAndroid;
  final int minForceIos;
  final String messageForce;
  final String messageInfo;
  final String appStoreId;
  final String appStoreLink;

  factory ForceUpdatePayload.fromRcv(Map<String, RemoteConfigValue> rc) =>
      ForceUpdatePayload(
        minInfoAndroid: rc["min_info_android"]?.asInt() ?? 0,
        minInfoIos: rc["min_info_ios"]?.asInt() ?? 0,
        minForceAndroid: rc["min_force_android"]?.asInt() ?? 0,
        minForceIos: rc["min_force_ios"]?.asInt() ?? 0,
        messageForce: rc["message_info"]?.asString() ?? "",
        messageInfo: rc["message_force"]?.asString() ?? "",
        appStoreId: rc["ios_store_id"]?.asString() ?? "",
        appStoreLink: rc["ios_store_link"]?.asString() ?? "",
      );

  int get minInfo {
    if (Platform.isAndroid) {
      return minInfoAndroid;
    } else if (Platform.isIOS) {
      return minInfoIos;
    }
    return 0;
  }

  int get minForce {
    if (Platform.isAndroid) {
      return minForceAndroid;
    } else if (Platform.isIOS) {
      return minForceIos;
    }
    return 0;
  }
}