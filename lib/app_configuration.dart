import 'package:skybase/core/app/app_info.dart';
import 'package:skybase/core/network/api_token_manager.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class AppConfiguration {
  //-- Main Configuration
  static const clientToken = 'Some Client Token';
  static const tokenType = TokenType.accessToken;
  static const baseUrlImage = 'https://image.tmdb.org/t/p/w500';

  //-- Production
  static const productionAPI = 'https://api.themoviedb.org/3';
  static const productionImageAPI = 'https://image.tmdb.org/t/p/w500';
  static const productionKey = '4a8d8611a243a3a3d004b0862d00283e';

  //-- Staging
  static const stagingAPI = 'https://api.themoviedb.org/3';
  static const stagingImageAPI = 'https://image.tmdb.org/t/p/w500';
  static const stagingKey = '4a8d8611a243a3a3d004b0862d00283e';

  //-- Development
  static const developmentAPI = 'https://api.themoviedb.org/3';
  static const developmentImageAPI = 'https://image.tmdb.org/t/p/w500';
  static const devKey = '4a8d8611a243a3a3d004b0862d00283e';

  //-- App Info
  static String appName = 'Movie App';
  static String appTag = r"Let's watch the movie";
  static String appVersion = AppInfo.packageInfo.version;
  static String buildNumber = AppInfo.packageInfo.buildNumber;
  static String packageName = AppInfo.packageInfo.packageName;
}