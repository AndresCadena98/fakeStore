import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fake_store/core/extensions/app_extensions.dart';
import 'package:fake_store/cubit/login_register_cubit.dart';
import 'package:fake_store/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Custom background color
  static const customBgColor = Color.fromARGB(255, 255, 255, 255);

  String _email = '';
  String _password = '';

  // Note: This is a form key which is used to hold the state of our form and this is the recommended way to do so.
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  TextEditingController usernameTE = TextEditingController();
  TextEditingController nameTE = TextEditingController();
  TextEditingController lastnameTE = TextEditingController();
  TextEditingController emailTE = TextEditingController();
  TextEditingController passnameTE = TextEditingController();

  // Sign in button styles
  final ButtonStyle btnStyle = ElevatedButton.styleFrom(
      primary: const Color.fromARGB(255, 27, 42, 74),
      elevation: 5.0,
      padding: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      textStyle: const TextStyle(
          fontSize: 18,
          fontFamily: 'GeneralSans',
          fontWeight: FontWeight.w500));

  // Full name input field widget
  Widget _buildNameField() {
    return TextFormField(
      controller: nameTE,
      decoration: InputDecoration(
        labelText: 'Name',
        contentPadding: const EdgeInsets.only(top: 10.0, left: 10.0),
        // prefixIcon: Icon(Icons.email, color: Colors.black87),
        hintText: 'Enter your name',
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 27, 42, 74),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(131, 177, 177, 177),
            width: 1.0,
          ),
        ),
      ),
    );
  }

  // Full name input field widget
  Widget _buildLastNameField() {
    return TextFormField(
      controller: lastnameTE,
      decoration: InputDecoration(
        labelText: 'Last Name',
        contentPadding: const EdgeInsets.only(top: 10.0, left: 10.0),
        // prefixIcon: Icon(Icons.email, color: Colors.black87),
        hintText: 'Enter last name',
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 27, 42, 74),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(131, 177, 177, 177),
            width: 1.0,
          ),
        ),
      ),
    );
  }

  Widget _buildUserNameField() {
    return TextFormField(
      controller: usernameTE,
      decoration: InputDecoration(
        labelText: 'User Name',
        contentPadding: const EdgeInsets.only(top: 10.0, left: 10.0),
        // prefixIcon: Icon(Icons.email, color: Colors.black87),
        hintText: 'User name',
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 27, 42, 74),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(131, 177, 177, 177),
            width: 1.0,
          ),
        ),
      ),
    );
  }

  // Email input field widget
  Widget _buildEmailField() {
    return TextFormField(
      controller: emailTE,
      decoration: InputDecoration(
        labelText: 'Email',
        contentPadding: const EdgeInsets.only(top: 10.0, left: 10.0),
        // prefixIcon: Icon(Icons.email, color: Colors.black87),
        hintText: 'Email',
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 27, 42, 74),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(131, 177, 177, 177),
            width: 1.0,
          ),
        ),
      ),
    );
  }

  // Password input field widget
  Widget _buildPasswordField() {
    return TextFormField(
      controller: passnameTE,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        contentPadding: const EdgeInsets.only(top: 10.0, left: 10.0),
        // prefixIcon: Icon(Icons.lock, color: Colors.black87),
        hintText: 'Enter your password',
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 27, 42, 74),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(131, 177, 177, 177),
            width: 1.0,
          ),
        ),
      ),
    );
  }

  // Login instead button widget
  Widget _buildLoginInsteadButton() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ));
        },
        // contentPadding: EdgeInsets.only(right: 0.0),
        child: const Text('Already have an account? Login instead',
            style: TextStyle(
                fontSize: 15.0,
                fontFamily: 'GeneralSans',
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(221, 23, 23, 23))),
      ),
    );
  }

  // Remember me checkbox widget
  Widget _buildRememberMeCheckBox() {
    return Container(
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(
                unselectedWidgetColor: Color.fromARGB(255, 177, 177, 177)),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.white,
              activeColor: const Color.fromARGB(221, 23, 23, 23),
              onChanged: (bool? value) {
                setState(() {
                  _rememberMe = value!;
                });
              },
            ),
          ),
          const Text('Remember me',
              style: TextStyle(
                  fontSize: 15.0,
                  fontFamily: 'GeneralSans',
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(221, 23, 23, 23)))
        ],
      ),
    );
  }

  // Sign in button widget
  Widget _buildSignInButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      child: ElevatedButton(
        style: btnStyle,
        onPressed: () {
          var cubit = context.read<LoginRegisterCubit>();
          int? id = cubit.register(
              usernameTE.text, nameTE.text, lastnameTE.text, passnameTE.text,emailTE.text);
         if(id != null){
           StylishDialog dialog = StylishDialog(
            context: context,
            alertType: StylishDialogType.SUCCESS,
            content: Text('ID: ${id.toString()}'),
            title: Text(
              'Registro Exitoso',
              style: GoogleFonts.workSans(
                color: Colors.black,
                fontSize: 15,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
              ),
            ),
            dismissOnTouchOutside: true,
          );
          dialog.show();
          Timer(Duration(seconds: 2), () {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
          });
         }else{
           StylishDialog dialog = StylishDialog(
            context: context,
            alertType: StylishDialogType.ERROR,

            title: Text(
              'Error en el registro',
              style: GoogleFonts.workSans(
                color: Colors.black,
                fontSize: 15,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
              ),
            ),
            dismissOnTouchOutside: true,
          );
          dialog.show();
         
         }
        },
        child: const Text('Join now'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Padding(
          padding: EdgeInsets.only(
            left: 10.0,
            top: 33.0,
          ),
        ),
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Padding(
            padding: EdgeInsets.only(
              top: 21.0,
              left: 25.0,
            ),
            child: Icon(
              Icons.chevron_left,
              color: Color.fromARGB(221, 23, 23, 23),
              size: 35,
            ),
          ),
        ),
        elevation: 0.0,
        centerTitle: false,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 120.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(bottom: 40.0),
                    child: Text('Register',
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: 'GeneralSans',
                            fontSize: 26.0,
                            fontWeight: FontWeight.w500)),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildUserNameField(),
                          const SizedBox(height: 20.0),
                          _buildNameField(),
                          const SizedBox(height: 20.0),
                          _buildLastNameField(),
                          const SizedBox(height: 20.0),
                          _buildEmailField(),
                          const SizedBox(height: 20.0),
                          _buildPasswordField(),
                          const SizedBox(height: 20.0),
                          
                          _buildLoginInsteadButton(),
                          const SizedBox(height: 20.0),
                          
                          const SizedBox(height: 35.0),
                          _buildSignInButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
