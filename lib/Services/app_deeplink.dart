import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart' show PlatformException;

class AppDeepLinkService {
  static Future<void> init() async {
    try {
      final initialLink = await getInitialLink();
      if (initialLink != null) {
        Uri uri = Uri.parse(initialLink);
        print('-------------------------------------------------------------');
        print("maja aa gya url mil gayi: $initialLink");
        _handleDynamicLink(uri.queryParameters);
      } else {
        print('-------------------------------------------------------------');
        log("link ni nila but chal rhaha hai");
      }
      // Parse the link and warn the user, if it is not correct,
      // but keep in mind it could be `null`.
    } on PlatformException catch (e) {
      print('-------------------------------------------------------------');
      print("platform error:$e ");
      // Handle exception by warning the user their action did not succeed
      // return?
    } on FormatException catch (e) {
      print('-------------------------------------------------------------');
      print("format error:$e ");
      // Handle exception by warning the user their action did not succeed
      // return?
    } catch (e) {
      print('-------------------------------------------------------------');
      print("other error:$e ");
    }
  }

  static void _handleDynamicLink(Map data) {
    // TODO: handle deeplink
    if (Get.context!.mounted) {
      if (data['type'] == 'test') Get.offAll(() => TestDynamicLink(data: data));
    } else {
      Future.delayed(Duration(milliseconds: 500), () {
        // TODO handle link here
        if (data['type'] == 'test') {
          Get.offAll(() => TestDynamicLink(data: data));
        }
      });
    }
  }

  String generateDeepLink(Map<String, dynamic> data) {
    Uri url = Uri(scheme: 'sport', host: 'testing', queryParameters: data);
    log("url: $url");
    return url.toString();
  }
}

class TestDynamicLink extends StatelessWidget {
  const TestDynamicLink({super.key, required this.data});
  final Map data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Link Testing"),
      ),
      body: Center(
        child: Text(
          "data found from link:\n" + data.toString(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
