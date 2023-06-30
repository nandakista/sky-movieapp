import 'package:skybase/app_configuration.dart';
import 'package:skybase/core/network/api_token_manager.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
enum Env {
  production,
  staging,
  development,
}

class AppEnv {
  static late Config config;
  static late Env env;

  static set(Env environment) {
    env = environment;
    switch (environment) {
      case Env.production:
        config = Config(
          baseUrl: AppConfiguration.productionAPI,
          baseUrlImage: AppConfiguration.productionImageAPI,
          apiKey: AppConfiguration.productionKey,
          tokenType: AppConfiguration.tokenType,
        );
        break;
      case Env.staging:
        config = Config(
          baseUrl: AppConfiguration.stagingAPI,
          baseUrlImage: AppConfiguration.stagingImageAPI,
          apiKey: AppConfiguration.stagingKey,
          tokenType: AppConfiguration.tokenType,
        );
        break;
      case Env.development:
        config = Config(
          baseUrl: AppConfiguration.developmentAPI,
          baseUrlImage: AppConfiguration.developmentImageAPI,
          tokenType: AppConfiguration.tokenType,
          apiKey: AppConfiguration.devKey,
        );
        break;
    }
  }
}

class Config {
  Config({
    required this.baseUrl,
    required this.baseUrlImage,
    required this.apiKey,
    required this.tokenType,
  });
  String baseUrl;
  String baseUrlImage;
  String apiKey;
  TokenType tokenType;
}