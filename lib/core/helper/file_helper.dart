import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:skybase/core/helper/snackbar_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class FileHelper {
  static String getFileSizeString(String path, int decimals) {
    int bytes = File(path).lengthSync();
    if (bytes <= 0) return '0 B';
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }

  static Future<List<File>?> pickFile({
    List<String>? allowedExtensions,
    bool allowMultiple = false,
  }) async {
    List<String> extensions = allowedExtensions ?? _defaultExtensions;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: extensions,
      allowMultiple: allowMultiple,
    );

    List<File>? data =
    result?.files.map((e) => File(e.path.toString())).toList();

    if (result != null) {
      /// Verify Extension
      /// Handle beberapa device android yang tidak support filter extension
      ///
      for (int i = 0; i < (result.paths.length); i++) {
        bool isMatches = false;
        for (String allowedExtension in extensions) {
          if (result.paths[i]!.endsWith(allowedExtension)) {
            isMatches = true;
          }
        }
        if (isMatches == false) {
          data?.removeAt(i);
          SnackBarHelper.error(message: 'Extension not allowed');
        }
      }
    }

    return data;
  }

  static List<String> get _defaultExtensions => [
    'pdf',
    'png',
    'jpeg',
    'jpg',
    'docx',
    'doc',
    'ppt',
    'pptx',
    'xls',
    'xlsx',
    'mp4',
    'mkv',
    'mov',
  ];

  static Future<void> viewDownloadedFile(String savePath) async {
    try {
      final result = await OpenFilex.open(savePath);
      debugPrint(result.message);
    } catch (e) {
      debugPrint("error: $e");
    }
  }

  static Future<void> openDownloadedFolder(String folderPath) async {
    try {
      final result = await OpenFilex.open(folderPath);
      debugPrint(result.message);
    } catch (e) {
      debugPrint("error: $e");
    }
  }

  static Future<void> openPlatformDownloadedFolder(String folderPath) async {
    if (Platform.isIOS) {
      final downloadDir = Uri.tryParse("shareddocuments://$folderPath")!;
      await launchUrl(downloadDir);
    } else if (Platform.isAndroid) {
      if (await Permission.manageExternalStorage.request().isGranted) {
        await FileHelper.openDownloadedFolder(folderPath);
      }
    }
  }

  static downloadAndOpenFile({required String url, String? fileName}) async {
    final name = fileName ?? url.split('/').last;
    final file = await downloadFilePath(url, name);
    debugPrint('Path : $file');
    OpenFilex.open(file);
  }


  static Future<String> downloadFilePath(String url, String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/$fileName';
    try {
      await Dio().download(url, filePath);
      return filePath;
    } catch (e) {
      throw Exception('Failed download, msg : $e');
    }
  }

  Future<Directory> getDirectory() async {
    Directory? directory;

    bool hasGranted = await checkStoragePermission();
    if (hasGranted) {
      directory = await _prepareSaveDir();
    }

    return directory!;
  }

  Future<bool> checkStoragePermission() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt <= 28) {
        final status = await Permission.storage.status;
        if (status != PermissionStatus.granted) {
          final result = await Permission.storage.request();
          if (result == PermissionStatus.granted) {
            return true;
          }
        } else {
          return true;
        }
      } else {
        return true;
      }
    } else if (Platform.isIOS) {
      return true;
    }
    return false;
  }

  Future<Directory> _prepareSaveDir() async {
    final localPath = await _findSavedDir();
    final savedDir = Directory(localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }

    return savedDir;
  }

  Future<String> _findSavedDir() async {
    String? externalStorageDirPath;

    if (Platform.isAndroid) {
      // final directory = await getExternalStorageDirectory();
      // externalStorageDirPath = directory?.absolute.path;
      externalStorageDirPath = "/storage/emulated/0/Download";
    } else if (Platform.isIOS) {
      externalStorageDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    } else {
      throw UnimplementedError(
          "_findLocalPath untuk platform ini belum dibuat");
    }
    debugPrint("externalStorageDirPath: $externalStorageDirPath");
    return externalStorageDirPath;
  }
}
