import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:price_checker/presentation/view/login/cubit/login_cubit.dart';
import 'package:price_checker/utils/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isShow = true;

  final formKey = GlobalKey<FormState>();
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.blue, size: 70),
                    const SizedBox(height: 20),
                    Text(
                      'Loading...',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: txtEmail,
                          validator: (value) =>
                              !isValidEmail(value!) ? 'Invalid email' : null,
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
                          validator: (value) =>
                              value!.isEmpty ? 'Password is empty' : null,
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
                            height: 50,
                            width: double.infinity,
                            function: () async {
                              if (formKey.currentState!.validate()) {
                                context.read<LoginCubit>().signIn(
                                    email: txtEmail.text,
                                    password: txtPassword.text);
                              }
                            },
                            text: "Sign in"),
                        const SizedBox(
                          height: 20,
                        ),
                        Text.rich(
                            TextSpan(text: "Don't have a account? ", children: [
                          TextSpan(
                              text: 'Sign up',
                              style: const TextStyle(color: Colors.blueAccent),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/register');
                                })
                        ])),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
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
