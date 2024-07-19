import 'package:flutter/material.dart';
import 'package:harman_app/widget/mobile_web_view.dart';

class WebViewScreen extends StatelessWidget {
  final String url;

  const WebViewScreen({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        shadowColor: Colors.white,
        backgroundColor: const Color.fromRGBO(43, 58, 81, 1),
        title: const Text(
          'Harman App',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: MobileWebView(
        url: url,
      ),
    );
  }
}
