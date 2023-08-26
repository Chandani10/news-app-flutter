

import 'dart:io';


class AppUtils{

  static String publishedAt(DateTime apiDate){

    String delay = '';

    var currentTime = DateTime.now().toUtc();

    var inMinutes = currentTime.difference(apiDate).inMinutes;
    var inHours = currentTime.difference(apiDate).inHours;
    var inDays = currentTime.difference(apiDate).inDays;

    if (!currentTime.difference(apiDate).isNegative) {
      if (inDays <= 1) {
        if (inMinutes < 60) {
          delay = '$inMinutes min ago ';
        } else {
          delay = '$inHours hours ago';
        }
      } else {
        if (inDays <= 31) {
          delay = '$inDays days ago';
        } else if (inDays / 365 == 0) {
          delay = '${1} year ago';
        } else {
          delay = '${(inDays / 31).ceil()} months ago';
        }
      }
    } else {
      delay = '';
    }

    return delay;

  }

  static Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }else{
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}