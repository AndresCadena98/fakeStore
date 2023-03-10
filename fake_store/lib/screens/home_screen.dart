import 'package:flutter/material.dart';
import 'package:fake_store/widgets/app_banner.dart';
import 'package:fake_store/widgets/app_home_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Custom color
  static const customBgColor = Color.fromARGB(255, 27, 42, 74);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: customBgColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Padding(
            padding: EdgeInsets.only(
              left: 10.0,
              top: 27.0,
            ),
            child: Text('FakeStore',
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'GeneralSans',
                  fontWeight: FontWeight.w500,
                )),
          ),
          elevation: 0.0,
          centerTitle: false,
        ),
        body: Column(
          children: const <Widget>[
            AppBanner(),
            AppHomeButtons(),
          ],
        ));
  }
}
