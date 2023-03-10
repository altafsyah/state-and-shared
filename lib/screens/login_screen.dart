import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_shared/helper/shared_preferences.dart';
import 'package:state_shared/screens/home_screen.dart';
import 'package:state_shared/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;

  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 230,
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Color(0xff331609), width: 5)),
              image: DecorationImage(
                image: AssetImage('assets/images/login_art.png'),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: GoogleFonts.poppins(
                      fontSize: 36, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 40,
                ),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailController,
                          cursorColor: Color(0xff331609),
                          style: GoogleFonts.poppins(
                              fontSize: 20, color: Color(0xff331609)),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff331609))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff331609))),
                            hintText: 'Email',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Color(0xff331609).withOpacity(0.5),
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color(0xff331609).withOpacity(0.5),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          controller: passwordController,
                          cursorColor: Color(0xff331609),
                          style: GoogleFonts.poppins(
                              fontSize: 20, color: Color(0xff331609)),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff331609))),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff331609))),
                            hintText: 'Password',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Color(0xff331609).withOpacity(0.5),
                            ),
                            prefixIcon: Icon(
                              Icons.password,
                              color: Color(0xff331609).withOpacity(0.5),
                            ),
                            suffixIcon: Icon(
                              Icons.visibility,
                              color: Color(0xff331609).withOpacity(0.5),
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        AuthService()
                            .signIn(
                                emailController.text, passwordController.text)
                            .then((value) {
                          if (value) {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                              (route) => false,
                            );
                          }
                        });
                      }
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 100),
                      decoration: BoxDecoration(
                          color: Color(0xff331609),
                          borderRadius: BorderRadius.circular(100)),
                      child: Text(
                        'SIGN IN',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffFDFBF6),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Center(
                  child: Text(
                    'Forgot password?',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Color(0xff331609),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
