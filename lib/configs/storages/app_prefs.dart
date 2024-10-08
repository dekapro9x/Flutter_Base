import 'dart:convert';
import 'package:app_base_flutter/configs/global_constants.dart';
import 'package:app_base_flutter/configs/storages/base_prefs.dart';
import 'package:app_base_flutter/models/home/response/room_list_response.dart';

class AppPrefStorage extends BasePrefsStorage {
  static Future<AppPrefStorage> instance() async {
    final _appPref = AppPrefStorage();
    await _appPref.init();
    return _appPref;
  }

  Future<void> setListRoomMeetingManage(
      {required List<Map<String, dynamic>> rooms}) async {
    String jsonString = jsonEncode(rooms);
    await setValueForKey(GlobalConstants.listRoomMeetingManage, jsonString);
  }

  //Gán danh sách phòng họp đã được booking của tôi (Thêm vào danh sách phòng mới):
  Future<void> setNewRoomMeetingBookingSuccess(
      {required List<Map<String, dynamic>> rooms}) async {
    String jsonString = jsonEncode(rooms);
    await setValueForKey(GlobalConstants.listRoomBookingSuccess, jsonString);
  }

  //Lấy danh sách phòng họp đã được booking của tôi:
  Future<List<Room>> getListRoomMeetingBookingSuccess() async {
    String? jsonString =
        await getValueForKey(GlobalConstants.listRoomBookingSuccess);
    if (jsonString != null && jsonString.isNotEmpty) {
      List<dynamic> jsonData = jsonDecode(jsonString);
      return jsonData.map((json) => Room.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  //Lấy danh sách phòng họp được quản lý:
  Future<List<Room>> getListRoomMeetingManage() async {
    String? jsonString =
        await getValueForKey(GlobalConstants.listRoomMeetingManage);
    if (jsonString != null && jsonString.isNotEmpty) {
      List<dynamic> jsonData = jsonDecode(jsonString);
      return jsonData.map((json) => Room.fromJson(json)).toList();
    } else {
      return [];
    }
  }

  //Lưu hành động người dùng đã đồng ý điều khoản:
  Future<void> saveActionsAcceptPolicyUseApp({required bool isAccept}) async {
    await setValueForKey(GlobalConstants.isAcceptPolicy, isAccept);
  }

  //Kiểm tra người dùng login chưa:
  Future<bool> hasLoggedIn() async {
    return false;
  }

  Future<String> getToken() async {
    await getValueForKey(GlobalConstants.TokenUserLogin);
    return 'USER_TOKEN:Whsjdhasdioueindajskdsa';
  }

  //Lưu trữ tài khoản đăng nhập:
  Future<void> saveUserLoginAndPassword({required String userLoginJson}) async {
    await setValueForKey(GlobalConstants.kUserLogin, userLoginJson);
  }

  //Lấy tài khoản đăng nhập:
  Future<String?> getUserLoginAndPassword() async {
    final _userLoginJson =
        this.getValueForKey<String?>(GlobalConstants.kUserLogin);
    if (_userLoginJson?.isEmpty ?? true) {
      return null;
    }
    return _userLoginJson;
  }

  //Xoá tài khoản đăng nhập:
  Future<void> removeLoginAndPassword() async {
    await this.remove(key: GlobalConstants.kUserLogin);
  }

  //Lấy trạng thái người dùng đồng ý điều khoản:
  Future<void> getActionsAcceptPolicyUseApp({required bool isAccept}) async {
    await getValueForKey(GlobalConstants.isAcceptPolicy);
  }

  //Lưu token account người dùng:
  Future<void> saveToken({required String tokenJson}) async {
    await setValueForKey(GlobalConstants.TokenUserLogin, tokenJson);
  }

  //Lưu thông tin user:
  Future<void> saveUser({required String userJson}) async {
    await setValueForKey(GlobalConstants.kUser, userJson);
  }

  //Lưu avatar cá nhân:
  Future<void> saveAvt({required String avtJson}) async {
    await setValueForKey(GlobalConstants.kAvt, avtJson);
  }

  Future<void> saveSkipOnboard({required bool isSkip}) async {
    await setValueForKey(GlobalConstants.kSkipOnboard, isSkip);
  }

  Future<void> saveProfile({required String profileJson}) async {
    await setValueForKey(GlobalConstants.kProfile, profileJson);
  }

  Future<bool> isSkipOnboard() async {
    final _isSkip =
        this.getValueForKey<bool?>(GlobalConstants.kSkipOnboard) ?? false;
    return _isSkip;
  }

  Future<void> changedAccount() async {
    await this.remove(key: GlobalConstants.kUser);
  }

  Future<void> logout() async {
    await this.remove(key: GlobalConstants.TokenUserLogin);
    await this.remove(key: GlobalConstants.kUser);
    await this.remove(key: GlobalConstants.kProfile);
  }

  Future<String?> getLanguage() async {
    final _language = this.getValueForKey<String?>(GlobalConstants.kLanguage);
    return _language;
  }

  Future<void> savelanguage({required String languageCode}) async {
    await this.setValueForKey(GlobalConstants.kLanguage, languageCode);
  }

  Future<String?> getFont() async {
    final _font = this.getValueForKey<String?>(GlobalConstants.FONT_FAMILY);
    return _font;
  }

  Future<void> setFont({required String font}) async {
    await this.setValueForKey(GlobalConstants.FONT_FAMILY, font);
  }

  Future<void> savePharmaciesList({required String pharmaciesList}) async {
    await setValueForKey(GlobalConstants.kPharmacies, pharmaciesList);
  }
}
