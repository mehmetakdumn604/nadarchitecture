import 'dart:developer';

import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher_string.dart';

extension StringExtensions on String? {
  // upper first letter
  String get upperFirstLetter {
    if (this == null || this!.isEmpty) {
      return "";
    }
    return this![0].toUpperCase() + this!.substring(1);
  }

  // launch review
  Future<void> launchReview() async {
    try {
      final bool isAvailable = await InAppReview.instance.isAvailable();

      if (isAvailable) {
        return InAppReview.instance.requestReview();
      } else {
        return InAppReview.instance.openStoreListing(
          appStoreId: this,
        );
      }
    } catch (e) {
      log('Error: \$e', name: 'StringExtensions launchReview()');
    }
  }

  // launch URL
  Future<bool> launchURL() async {
    try {
      if (this == null || this!.isEmpty) {
        return false;
      }
      if (await canLaunchUrlString(this!)) {
        launchUrlString(this!);
        return true;
      }
      return false;
    } catch (e) {
      log('Error: \$e', name: 'StringExtensions launchURL()');
      return false;
    }
  }

  // open mail
  Future<bool> openMail() async {
    if (this == null || this!.isEmpty) {
      return false;
    }
    try {
      if (await canLaunchUrlString('mailto:\$this')) {
        launchUrlString('mailto:\$this');
        return true;
      }
      return false;
    } catch (e) {
      log('Error: \$e', name: 'StringExtensions openMail()');
      return false;
    }
  }
}
