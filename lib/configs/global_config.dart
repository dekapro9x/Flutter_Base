import 'dart:io';

import 'package:flutter/material.dart';

class GlobalConfigs {
  static const String appName = 'BeoTranDevApp';
  static const supportedLocales = [
    Locale('en'),
    Locale('vi'),
  ];
  static final String versionAppBuildLocal = Platform.isIOS ? '1.0.0' : '1.0.0';
  static const String kBaseUrl = 'https://krmedi.vn';
  static const String ahaMoveBaseUrl = 'https://apistg.ahamove.com';
  static const String kGoogleMapKey = 'AIzaSyDQO5YhrnYxyI215uOX9bNQ-_xxV_stGf8';
  static const String ahaMoveAPIKey =
      'c7a362387a0fe2e7ed2f3ee6e0df8ded726a9ea8';
  static const String sha1AppKrmedi =
      '9C:39:82:EB:12:99:0A:DD:3D:1A:C3:29:A1:C0:9E:57:B5:81:16:B2';
  static const String sha256AppKrmedi =
      'D2:70:2B:94:3A:63:72:03:86:38:09:B0:85:86:1B:01:35:05:CE:16:2A:F1:F7:AE:3D:52:D8:5B:CF:F8:B8:93';
}
