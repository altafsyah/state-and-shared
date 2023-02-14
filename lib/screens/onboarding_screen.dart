import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_shared/helper/shared_preferences.dart';
import 'package:state_shared/screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int index = 0;

  @override
  void initState() {
    Timer(Duration(milliseconds: 700), () {
      setState(() {
        index = 1;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
          color: index == 0 ? Color(0xffFB5D1F) : Color(0xffFDFBF6),
          width: double.infinity,
          child: index == 0
              ? Column()
              : Stack(
                  children: [
                    Positioned(
                        // bottom: 100,
                        width: MediaQuery.of(context).size.width,
                        top: 250,
                        child: Image.asset('assets/images/onboarding_bg.png')),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 24),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/logo_bantuin.png',
                                height: 70,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: 'bantu',
                                    style: GoogleFonts.poppins(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffFB5D1F),
                                    ),
                                    children: [
                                      TextSpan(
                                          text: 'in',
                                          style: TextStyle(
                                              color: Color(0xff331609)))
                                    ]),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 28,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: RichText(
                              textAlign: TextAlign.right,
                              text: TextSpan(
                                  text: 'Get started ',
                                  style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff331609),
                                  ),
                                  children: [
                                    TextSpan(
                                        text:
                                            'now and\nmake your life more\nproductive',
                                        style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500))
                                  ]),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () async {
                              setOnboardingSeen(true).then((value) =>
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                    (route) => false,
                                  ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff331609),
                                  borderRadius: BorderRadius.circular(100)),
                              padding: EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 90),
                              child: Text(
                                'Get started',
                                style: GoogleFonts.poppins(
                                    color: Color(0xffFDFBF6),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
