import 'package:evntown/authentication/firebaseAuth.dart';
import 'package:evntown/screens/auth_screen/login_screen.dart';
import 'package:evntown/utilities/models_classes_methodes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signUpKey = GlobalKey<FormState>();

  IconData _icon = Icons.visibility_off;

  bool _isVisible = true;

  bool _isHash = true;

  IconData _iconConf = Icons.visibility_off;

  bool _isVisibleConf = true;

  bool _isHashConf = true;

  TextEditingController _nameEditingText;

  TextEditingController _passwordEditingText;

  TextEditingController _conformPassEditingText;

  TextEditingController _emailEditingText;

  FireBaseAuthentication fireBaseAuthentication;

  @override
  void initState() {
    _nameEditingText = TextEditingController();
    _passwordEditingText = TextEditingController();
    _conformPassEditingText = TextEditingController();
    _emailEditingText = TextEditingController();
    fireBaseAuthentication = FireBaseAuthentication();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffecedef),
      body: Padding(
        padding: const EdgeInsets.only(top: 64, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Form(
            key: _signUpKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Let's Get Started!",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.1),
                ),
                giveSpace(.02, context),
                Text(
                  "Create an account to be part of EVNTOWN",
                  style: TextStyle(
                      color: Colors.grey.shade500, fontWeight: FontWeight.bold),
                ),
                giveSpace(.05, context),
                _drawNameOrEmail(
                  _nameEditingText,
                  'Name',
                  "Enter your name please",
                  Icons.person,
                ),
                giveSpace(.03, context),
                _drawNameOrEmail(
                  _emailEditingText,
                  'Email',
                  "Enter your Email please",
                  Icons.email,
                ),
                giveSpace(0.03, context),
                _drawPasswordEditText(),
                giveSpace(0.03, context),
                _drawConfPasswordEditText(),
                giveSpace(.05, context),
                _drawSignUpButton(),
                giveSpace(0.07, context),
                _drawLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawNameOrEmail(
    TextEditingController controller,
    String title,
    String errorMassage,
    IconData icon,
  ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: title,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      validator: (onValue) {
        if (onValue.isEmpty) {
          return errorMassage;
        }
        return null;
      },
    );
  }

  Widget _drawPasswordEditText() {
    return TextFormField(
      obscureText: _isHash,
      controller: _passwordEditingText,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () {
            if (_isVisible) {
              setState(() {
                _icon = Icons.visibility;
                _isHash = false;
                _isVisible = false;
                this._emailEditingText.text = _emailEditingText.text;
                this._nameEditingText.text = _nameEditingText.text;
                this._conformPassEditingText.text =
                    _conformPassEditingText.text;
                this._passwordEditingText.text = _passwordEditingText.text;
              });
            } else if (!_isVisible) {
              setState(() {
                _icon = Icons.visibility_off;
                _isHash = true;
                _isVisible = true;
                this._emailEditingText.text = _emailEditingText.text;
                this._nameEditingText.text = _nameEditingText.text;
                this._conformPassEditingText.text =
                    _conformPassEditingText.text;
                this._passwordEditingText.text = _passwordEditingText.text;
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

  Widget _drawConfPasswordEditText() {
    return TextFormField(
      obscureText: _isHashConf,
      controller: _conformPassEditingText,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        suffixIcon: IconButton(
          onPressed: () {
            if (_isVisibleConf) {
              setState(() {
                _iconConf = Icons.visibility;
                _isHashConf = false;
                _isVisibleConf = false;
                this._emailEditingText.text = _emailEditingText.text;
                this._nameEditingText.text = _nameEditingText.text;
                this._conformPassEditingText.text =
                    _conformPassEditingText.text;
                this._passwordEditingText.text = _passwordEditingText.text;
              });
            } else if (!_isVisibleConf) {
              setState(() {
                _iconConf = Icons.visibility_off;
                _isHashConf = true;
                _isVisibleConf = true;
                this._emailEditingText.text = _emailEditingText.text;
                this._nameEditingText.text = _nameEditingText.text;
                this._conformPassEditingText.text =
                    _conformPassEditingText.text;
                this._passwordEditingText.text = _passwordEditingText.text;
              });
            }
          },
          icon: Icon(_iconConf),
        ),
        hintText: "Conform Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      validator: (onValue) {
        if (onValue.isEmpty) {
          return "repeat your password please";
        } else if (onValue.isNotEmpty) {
          if (onValue == _passwordEditingText.text) {
            return null;
          }
          return "your password don't match";
        }
        return null;
      },
    );
  }

  Widget _drawSignUpButton() {
    return InkWell(
      onTap: () async {
        //todo: link it with firebase and with fireStore
        //todo: make controllers empty
        //todo: make page loading after finish and nav to home

        String name, pass;
        name = _emailEditingText.text;
        pass = _passwordEditingText.text;

        if (_signUpKey.currentState.validate()) {
          await fireBaseAuthentication.login(name, pass).then((on) {
            Navigator.pushNamed(context, '/login');
          });
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .4,
        height: MediaQuery.of(context).size.height * .07,
        decoration: BoxDecoration(
            color: Color(0xff263238), borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            "Sign Up",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _drawLogin() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontSize: 18, color: Color(0xff9e9e9e)),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            child: Text(
              "Login",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _passwordEditingText.dispose();

    _conformPassEditingText.dispose();

    _nameEditingText.dispose();

    _emailEditingText.dispose();

    _icon = Icons.visibility_off;

    _isVisible = true;

    _isHash = true;

    _iconConf = Icons.visibility_off;

    _isVisibleConf = true;

    _isHashConf = true;

    super.dispose();
  }
}
