import 'package:flutter/material.dart';
import '../components/input.dart';
import '../components/button.dart';
import '../components/passwordInput.dart';
import '../helpers/validations.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _hasEmailError = false;
  bool _hasPasswordError = false;
  String? _emailErrorMessage;
  String? _passwordErrorMessage;
  bool _isSubmitted = false;

  void _validate() {
    bool emailIsValid = _validateEmail(_emailController.text);
    bool passwordIsValid = _validatePassword(_passwordController.text);

    setState(() {
      _isSubmitted = true;
    });

    if (emailIsValid && passwordIsValid) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("Sign Up Success"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  bool _validateEmail(String email) {
    if (email.isEmpty) {
      setState(() {
        _hasEmailError = true;
        _emailErrorMessage = 'Email is requaird';
      });

      return false;
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      setState(() {
        _hasEmailError = true;
        _emailErrorMessage = 'Please enter a valid email address';
      });

      return false;
    }

    setState(() {
      _hasEmailError = false;
      _emailErrorMessage = null;
    });

    return true;
  }

  bool _validatePassword(String password) {
    if (password.isEmpty ||
        !validateMinLength(password) ||
        !validateMaxLength(password) ||
        !validateOneUppercaseLetter(password) ||
        !validateOneDigit(password)) {
      setState(() {
        _hasPasswordError = true;
        _passwordErrorMessage =
            "This password doesn't look right. \n Please try again or reset it now. ";
      });

      return false;
    }

    setState(() {
      _hasPasswordError = false;
      _passwordErrorMessage = null;
    });

    return true;
  }

  void switchIsSubmitted() {
    if (_isSubmitted) {
      setState(() {
        _isSubmitted = false;
      });
    }
  }

  void _onChangeEmail(String value) {
    if (_hasEmailError) {
      setState(() {
        _hasEmailError = false;
        _emailErrorMessage = null;
      });
    }

    switchIsSubmitted();
  }

  void _onChangePassword(String value) {
    if (_hasPasswordError) {
      setState(() {
        _hasPasswordError = false;
        _passwordErrorMessage = null;
      });
    }

    switchIsSubmitted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text(
              'Sign up',
              style: TextStyle(
                fontSize: 28,
                color: Color(0xff4A4E71),
                fontWeight: FontWeight.bold,
              ),
            ),
            Input(
              onChange: _onChangeEmail,
              isSubmitted: _isSubmitted,
              isError: _hasEmailError,
              controller: _emailController,
              errorText: _emailErrorMessage,
              placeholder: 'Enter your email',
              padding: const EdgeInsets.only(top: 20),
            ),
            PasswordInput(
              isSubmitted: _isSubmitted,
              isError: _hasPasswordError,
              onChange: _onChangePassword,
              controller: _passwordController,
              errorText: _passwordErrorMessage,
              placeholder: 'Enter your password',
              padding: const EdgeInsets.only(top: 20),
            ),
            Button(
              width: 240,
              name: 'Sign up',
              onClick: _validate,
              padding: const EdgeInsets.only(top: 57),
            ),
          ],
        ),
      ),
    );
  }
}
