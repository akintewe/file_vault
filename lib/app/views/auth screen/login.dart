import 'package:file_vault/app/views/auth%20screen/auth_service.dart';
import 'package:file_vault/app/views/homescreen/views/homescreen.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/loginback.png',
            fit: BoxFit.fill,
          ),
          Positioned(
              top: 60,
              left: 0,
              child: SizedBox(
                  height: 400,
                  width: 400,
                  child: Lottie.asset('assets/animations/security.json'))),
          Positioned(
              top: 410,
              left: 110,
              child: Text(
                'Welcome to',
                style: GoogleFonts.roboto(
                    color: Color.fromRGBO(137, 89, 208, 1), fontSize: 30),
              )),
          Positioned(
              top: 450,
              left: 110,
              child: Text(
                'Safe Vault',
                style:
                    GoogleFonts.roboto(color: Colors.deepPurple, fontSize: 35),
              )),
          Positioned(
              top: 570,
              left: 90,
              child: SizedBox(
                height: 50,
                width: 220,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(137, 89, 208, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        )),
                    onPressed: () async {
                      final email = await FirebaseServices().signInWithGoogle();
                      print(email);

                      if (email != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      }
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/Google.png',
                          height: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Continue with Google',
                          style: GoogleFonts.roboto(color: Colors.white),
                        )
                      ],
                    )),
              ))
        ],
      ),
    );
  }
}
