import 'package:shared_preferences/shared_preferences.dart';
import 'logs.dart';

class CacheUtils {
  static const _onboardingCacheKey = 'hasSeenOnboarding';
  static const _userRoleCacheKey = 'cached_user_role';

  static Future<bool> checkOnBoardingStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(_onboardingCacheKey) ?? false;
    } catch (e) {
      DevLogs.logError('Error checking onboarding status: $e');
      return false;
    }
  }

  // static Future<UserRole?> checkUserRole() async {
  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     final role = prefs.getString(_userRoleCacheKey) ?? '';
  //     DevLogs.logSuccess('Registered Role == $role');

  //     if (role == 'agent') {
  //       return UserRole.agent;
  //     } else if (role == 'client') {
  //       return UserRole.client;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     DevLogs.logError('Error checking user role: $e');
  //     return null;
  //   }
  // }

  static Future<void> saveUserRoleToCache({required String role}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      DevLogs.logSuccess('Saved $role to cache');
      await prefs.setString(_userRoleCacheKey, role);
    } catch (e) {
      DevLogs.logError('Error saving user role to cache: $e');
    }
  }

  static Future<bool> updateOnboardingStatus(bool status) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_onboardingCacheKey, status);
      return prefs.getBool(_onboardingCacheKey) ?? false;
    } catch (e) {
      DevLogs.logError('Error updating onboarding status: $e');
      return false;
    }
  }


  static Future<void> clearCachedRole() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_userRoleCacheKey);
    } catch (e) {
      DevLogs.logError('Error clearing role cache: $e');
    }
  }
}
