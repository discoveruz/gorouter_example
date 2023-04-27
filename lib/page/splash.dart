import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_example/page/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/splash';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.goNamed(HomePage.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          style: FlutterLogoStyle.horizontal,
          curve: Curves.bounceInOut,
          duration: Duration(seconds: 2),
          size: 200,
          textColor: Colors.blue,
        ),
      ),
    );
  }
}
