import 'package:evntown/authentication/firebaseAuth.dart';
import 'package:evntown/screens/auth_screen/signup_screen.dart';
import 'package:evntown/utilities/models_classes_methodes.dart';
import 'package:evntown/utilities/multi_screen_android.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailTextController;

  TextEditingController _passwordTextController;

  IconData _icon = Icons.visibility_off;

  bool _isVisible = true;

  bool _isHash = true;

  final _formKey = GlobalKey<FormState>();

  setScreenLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('screenHome', false);
    await prefs.setBool('screenLoging', true);
  }

  FireBaseAuthentication fireBaseAuthentication;

  @override
  void initState() {
    _passwordTextController = TextEditingController();
    _emailTextController = TextEditingController();
    fireBaseAuthentication = FireBaseAuthentication();
    super.initState();
    setScreenLocation();
  }

  @override
  Widget build(BuildContext context) {
    DetectedScreen detectedScreen = DetectedScreen(context);
    LoginScreenProperties loginScreenProperties =
        LoginScreenProperties(detectedScreen);
//WillPopScope make you can control with back button in android
    return WillPopScope(
      onWillPop: () {
        // @pop is function to make us navigation from screen to home android screen system
        return pop();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _drawLogo(),
                  _drawEditText(Icons.email, 'Email', 'Please enter your email',
                      loginScreenProperties.editTextSize),
                  giveSpace(.03, context),
                  _drawPasswordEditText(loginScreenProperties.editTextSize),
                  giveSpace(.01, context),
                  _drawForgetPass(loginScreenProperties.forgetTextSize),
                  giveSpace(.03, context),
                  _drawLoginButton(loginScreenProperties.loginTextSize),
                  giveSpace(0.08, context),
                  _drawFacebookButton(
                      loginScreenProperties.faceAndGoogleTextSize),
                  giveSpace(0.01, context),
                  _drawGoogleButt(loginScreenProperties.faceAndGoogleTextSize),
                  giveSpace(0.07, context),
                  _drawSignUp(loginScreenProperties.signUpText),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawLogo() {
    return Container(
      width: MediaQuery.of(context).size.width * .75,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: ExactAssetImage(
                "assets/images/logo_in_black.png",
              ),
              fit: BoxFit.cover)),
    );
  }

  Widget _drawEditText(IconData icon, String boxName, String validatorText,
      double titleTextSize) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.085,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: TextFormField(
        style: TextStyle(fontSize: titleTextSize),
        keyboardType: TextInputType.emailAddress,
        controller: _emailTextController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          filled: true,
          isDense: true,
          prefixIcon: Icon(icon),
          hintText: boxName,
        ),
        validator: (onValue) {
          if (onValue.isEmpty) {
            return validatorText;
          }
          return null;
        },
      ),
    );
  }

  Widget _drawPasswordEditText(double textFontSize) {
    return TextFormField(
      style: TextStyle(
        fontSize: textFontSize,
      ),
      obscureText: _isHash,
      controller: _passwordTextController,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () {
            if (_isVisible) {
              setState(() {
                _icon = Icons.visibility;
                _isHash = false;
                _isVisible = false;
                this._emailTextController.text = _emailTextController.text;
                this._passwordTextController.text =
                    _passwordTextController.text;
              });
            } else if (!_isVisible) {
              setState(() {
                _icon = Icons.visibility_off;
                _isHash = true;
                _isVisible = true;
                this._emailTextController.text = _emailTextController.text;
                this._passwordTextController.text =
                    _passwordTextController.text;
              });
            }
          },
          icon: Icon(_icon),
        ),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      validator: (onValue) {
        if (onValue.isEmpty) {
          return "Enter your password please";
        }
        return null;
      },
    );
  }

  Widget _drawForgetPass(double forgetTextSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/home');
          },
          child: Text(
            "Forget Password?",
            style: TextStyle(
              fontSize: forgetTextSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _drawLoginButton(double textButtonSize) {
    return InkWell(
      onTap: () async {
        String name, pass;
        name = _emailTextController.text;
        pass = _passwordTextController.text;

        if (_formKey.currentState.validate()) {
          await fireBaseAuthentication.login(name, pass).then((on) {
            Navigator.pushNamed(context, '/home');
          });

//        if (firebaseUser.uid != null) {
        }
        //todo: make controllers empty
        //todo: make page loading after finish and nav to home
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .4,
        height: MediaQuery.of(context).size.height * .07,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              blurRadius: .75,
              spreadRadius: .75,
              offset: Offset(0.0, 0.0),
            )
          ],
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(colors: [
            Color(0xff264138),
            Color(0xff263238),
          ]),
        ),
        child: Center(
          child: Text(
            "LOG IN",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: textButtonSize,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawFacebookButton(double textFaceButtonSize) {
    return InkWell(
      onTap: () {
        //todo: link facebook
        //todo: make controllers empty
        //todo: make page loading after finish and Nav to home
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .4,
        height: MediaQuery.of(context).size.height * .06,
        decoration: BoxDecoration(
            color: Color(0xff6081c4), borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("assets/images/facebook_icon.png"),
                  ),
                ),
                width: MediaQuery.of(context).size.width * .09,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              Text(
                "Facebook ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: textFaceButtonSize,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawGoogleButt(double googleTextSize) {
    return InkWell(
      onTap: () {
        //todo: link Google
        //todo: make controllers empty
        //todo: make page loading after finish
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .4,
        height: MediaQuery.of(context).size.height * .06,
        decoration: BoxDecoration(
            color: Colors.redAccent, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("assets/images/google_icon.png"),
                  ),
                ),
                width: MediaQuery.of(context).size.width * .07,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .04,
              ),
              Text(
                "Google ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: googleTextSize,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawSignUp(double signUpScreen) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Don't have an account?",
          style: TextStyle(fontSize: signUpScreen, color: Color(0xff9e9e9e)),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SignUpScreen(),
              ),
            );
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: signUpScreen,
                color: Colors.blue,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  @override
  // ignore: must_call_super
  void dispose() {
    _passwordTextController.dispose();
    _emailTextController.dispose();
    super.dispose();
  }

  Future<void> pop() async {
    await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
  }
}
