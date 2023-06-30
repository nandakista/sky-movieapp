import 'dart:async';

import 'package:get/get.dart';
import 'package:skybase/core/database/get_storage/get_storage_key.dart';
import 'package:skybase/core/database/get_storage/get_storage_manager.dart';
import 'package:skybase/core/database/secure_storage/secure_storage_manager.dart';
import 'package:skybase/core/auth_manager/auth_state.dart';
import 'package:skybase/core/themes/theme_manager.dart';
import 'package:skybase/data/models/user.dart';
import 'package:skybase/domain/entities/user/user.dart';
import 'package:skybase/ui/views/intro/intro_view.dart';
import 'package:skybase/ui/views/splash/splash_view.dart';
import 'package:skybase/ui/views/main_navigation/main_nav_view.dart';

/// This class will called first time before app go to pages.
///
/// This class help you to manage authentication process.
/// Contains auth general function such as [login], [logout], and first install/[setup]
class AuthManager extends GetxService {
  static AuthManager get find => Get.find<AuthManager>();

  Rxn<AuthState> authState = Rxn<AuthState>();
  Stream<AuthState?> get stream => authState.stream;
  AuthState? get state => authState.value;

  GetStorageManager getStorage = GetStorageManager.find;
  SecureStorageManager secureStorage = SecureStorageManager.find;
  ThemeManager themeManager = ThemeManager.find;

  @override
  void onInit() {
    authState.value = const AuthState(appStatus: AppType.initial);
    super.onInit();
  }

  @override
  void onReady() async {
    ever(authState, authChanged);
    authChanged(state);
    super.onReady();
  }

  authChanged(AuthState? state) async {
    switch (state?.appStatus) {
      case AppType.initial:
        await setup();
        break;
      case AppType.firstInstall:
        Timer(
          const Duration(seconds: 2),
          () => Get.offAllNamed(IntroView.route),
        );
        break;
      case AppType.unauthenticated:
        Timer(
          const Duration(seconds: 2),
          () => login(
            user: UserModel(),
            token: 'token',
            refreshToken: 'refreshToken',
          ),
        );
        break;
      case AppType.authenticated:
        Get.offAllNamed(MainNavView.route);
        break;
      default:
        Get.toNamed(SplashView.route);
    }
  }

  setup() async {
    checkFirstInstall();
    await checkAppTheme();
  }

  /// Check if app is first time installed. It will navigate to Introduction Page
  void checkFirstInstall() async {
    final bool firstInstall =
        getStorage.get(GetStorageKey.firstInstall) ?? true;
    if (firstInstall) {
      await secureStorage.setToken(value: '');
      authState.value = const AuthState(appStatus: AppType.firstInstall);
    } else {
      checkUser();
    }
  }

  /// Checking App Theme set it before app display
  Future<void> checkAppTheme() async {
    final bool isDarkTheme =
        await getStorage.getAwait(GetStorageKey.darkTheme) ?? false;
    if (isDarkTheme) {
      themeManager.toDarkMode();
    } else {
      themeManager.toLightMode();
    }
  }

  /// This function to used for checking is valid token to API Server use GET User Endpoint (token required).
  /// If response is Error it will passed to [logout] process.
  Future<void> checkUser() async {
    secureStorage.setToken(value: 'value');
    setAuth();
    // TODO: Verify token with API
    // AuthApiImpl authApi = AuthApiImpl();
    // final String? token = await secureStorage.getToken();
    // User? user = getStorage.get(GetStorageKey.users);
    // try {
    //   await authApi
    //       .verifyToken(userId: user?.id ?? 0, token: token.toString())
    //       .then((res) async {
    //   setAuth();
    //   });
    // } catch (err) {
    //   logout();
    // }
  }

  /// Set auth state to AppType.AUTHENTICATED
  void setAuth() async {
    if (await secureStorage.isLoggedIn()) {
      authState.value = const AuthState(appStatus: AppType.authenticated);
    }
  }

  /// Just call this function to managed logout process.
  /// It will stream state and auto redirect your apps to page based on their state
  /// with [authChanged] function
  /// * No need to navigate manually (Get.to or Get.off)
  Future<void> logout() async {
    await secureStorage.logout();
    getStorage.logout();
    authState.value = const AuthState(appStatus: AppType.unauthenticated);
  }

  /// Just call this function to managed login process.
  /// It will stream state and auto redirect your apps to page based on their state
  /// with [authChanged] function
  /// * No need to navigate manually (Get.to or Get.off).
  Future<void> login({
    required UserModel user,
    required String token,
    required String refreshToken,
  }) async {
    await saveAuthData(user: user, token: token, refreshToken: refreshToken);
    setAuth();
  }

  Future<void> saveAuthData({
    required UserModel user,
    required String token,
    required String refreshToken,
  }) async {
    getStorage.save(GetStorageKey.users, user.toJson());
    await secureStorage.setToken(value: token);
    await secureStorage.setRefreshToken(value: refreshToken);
  }

  /// Get User data from GetStorage
  /// * No need to decode or call fromJson again when you used this helper
  User? get user {
    if (getStorage.has(GetStorageKey.users)) {
      return UserModel.fromJson(getStorage.get(GetStorageKey.users));
    } else {
      return null;
    }
  }
}
