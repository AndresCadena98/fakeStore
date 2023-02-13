import 'package:flutter/material.dart';
import 'package:fake_store/screens/login_screen.dart';
import 'package:fake_store/screens/register_screen.dart';

class AppHomeButtons extends StatefulWidget {
  const AppHomeButtons({Key? key}) : super(key: key);

  @override
  State<AppHomeButtons> createState() => _AppHomeButtonsState();
}

class _AppHomeButtonsState extends State<AppHomeButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: SizedBox(
                        width: 320,
                        height: 44,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            primary: Colors.black87,
                            textStyle: const TextStyle(fontSize: 18),
                            side:
                                const BorderSide(color: Colors.white, width: 1),
                            elevation: 3,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterScreen())),
                          child: const Text('Join now',
                              style: TextStyle(
                                  fontFamily: 'GeneralSans',
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                   
                    
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 18),
                          side: const BorderSide(color: Colors.transparent)),
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen())),
                      child: const Text('Sign in',
                          style: TextStyle(
                              fontFamily: 'GeneralSans',
                              fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
