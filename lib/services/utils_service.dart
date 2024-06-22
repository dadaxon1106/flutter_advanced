import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      timeInSecForIosWeb: 1,
      fontSize: 16,
    );
  }

  static Future<Map<String, String>> getInfo() async {
    Map<String, String> params = {};
    var infoDevice = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var androidInfo = await infoDevice.androidInfo;
      params.addAll(
        {
          'deviceId': androidInfo.id,
          'deviType': 'A',
          'deviceToken': "aaa",
        },
      );
    } else {
      var iosInfo = await infoDevice.iosInfo;
      params.addAll({
        'deviceID': iosInfo.identifierForVendor!,
        'deviceType': "I",
        'deviceToken': "bbb"
      });
    }
    return params;
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    launchUrl(Uri(scheme: 'tel', path: phoneNumber));
  }

  static Future<void> makeUrl(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    } else {
      throw 'Could not find the site $url';
    }
  }
}
