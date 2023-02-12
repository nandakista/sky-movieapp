import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skybase/core/download_manager/download_manager.dart';
import 'package:skybase/core/helper/sky_snackbar.dart';

class UtilityController extends GetxController {
  String tag = 'UtilityController: ';
  RxDouble progressDownload = 0.0.obs;
  String url1 =
      'https://media.neliti.com/media/publications/249244-none-837c3dfb.pdf';

  listenDownload() {
    DownloadManager().downloadInfo.listen((task) {
      progressDownload.value = task.progress.toDouble() / 100;
    });
  }

  downloadFile() async {
    DownloadManager()
        .download(
          url: url1,
          onError: (errorMessage) {
            SkySnackBar.showError(message: errorMessage.toString());
          },
        )
        .then((_) => DownloadManager().showDownloadedSnackBar());
    listenDownload();
  }
}
