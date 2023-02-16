import 'dart:async';

import 'package:flutter/material.dart';
import 'package:state_shared/helper/shared_preferences.dart';
import 'package:state_shared/screens/home_screen.dart';
import 'package:state_shared/screens/login_screen.dart';
import 'package:state_shared/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Route _pageTransition(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: ((context, animation, secondaryAnimation) => screen),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.ease;
        var tween =
            Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: curve));
        return ScaleTransition(
          scale: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Future isOnboarding() async {
    print('matep;');
    bool? isOnboardingSeen = await getOnboardingSeen();
    int? userToken = await getToken();
    if (isOnboardingSeen != null && isOnboardingSeen) {
      if (userToken != null) {
        Navigator.of(context).pushAndRemoveUntil(
            _pageTransition(HomeScreen()), (route) => false);
      } else {
        Navigator.of(context).pushAndRemoveUntil(
            _pageTransition(LoginScreen()), (route) => false);
      }
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          _pageTransition(OnboardingScreen()), (route) => false);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), isOnboarding);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff537FE7),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/splash_bg.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}
