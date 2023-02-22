import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logger/logger.dart';
import 'package:price_checker/services/auth.dart';
import 'package:price_checker/utils/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();
  bool _isShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Register', style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 30, color: Colors.grey),),
              const SizedBox(height: 40,),
              TextFormField(
                controller: txtEmail,
                validator: (value) => !isValidEmail(value!) ? 'Invalid email' : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  label: Text('Email'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: txtPassword,
                validator: (value) => value!.isEmpty ? 'Password is empty' : null,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: const Text('Password'),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isShow = !_isShow;
                          });
                        },
                        icon: Icon(_isShow
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye))),
                obscureText: _isShow,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  height: 50, width: double.infinity, function: () {
                var logger = Logger();
                if(formKey.currentState!.validate()){
                  dynamic result = AuthService().registerWithEmailAndPassword(email: txtEmail.text, password: txtPassword.text);
                  if(result != null){
                    Fluttertoast.showToast(msg: 'Successfully registered!',);
                    // Navigator.pushReplacementNamed(context, '/login');
                  }
                } else {
                  logger.wtf('Invalid email or password!');
                }
              }, text: "Sign up"),
              const SizedBox(
                height: 20,
              ),
              Text.rich(TextSpan(
                  text: "Already have a account? ",
                  children: [
                    TextSpan(
                        text: 'Sign in',
                        style: const TextStyle(color: Colors.blueAccent),
                        recognizer: TapGestureRecognizer()..onTap = (){
                          Navigator.pushNamed(context, '/dashboard');
                        }
                    )
                  ]
              )),
            ],
          ),
        ),
      ),
    );
  }
}

bool isValidEmail(String value) {
  return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(value);
}
