import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _index = 0;
  bool _isShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF3C3F41),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stepper(
              currentStep: _index,
              onStepCancel: () {
                if (_index > 0) {
                  setState(() {
                    _index -= 1;
                  });
                }
              },
              onStepContinue: () {
                if (_index <= 0) {
                  setState(() {
                    _index += 1;
                  });
                }
              },
              onStepTapped: (int index) {
                setState(() {
                  _index = index;
                });
              },
              steps: [
                Step(
                  title: const Text('Step 1 Personal Information'),
                  content: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: const [
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                              ),
                              label: Text('Firstname'),
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                              ),
                              label: Text('Middlename'),
                            ),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)
                              ),
                              label: Text('Lastname'),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                Step(
                  title: const Text('Step 2 User Account'),
                  content: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)
                          ),
                          label: Text('Username'),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextField(
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            label: const Text('Password'),
                            suffixIcon: IconButton(onPressed: (){
                              setState(() {
                                _isShow = !_isShow;
                              });
                            }, icon: Icon(_isShow ? Icons.remove_red_eye_outlined : Icons.remove_red_eye))
                        ),
                        obscureText: _isShow,
                      ),
                    ],
                  ),
                ),
              ],
          ),
          Visibility(
            visible: _index == 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(child: Text('Register Now')),
              ),
            ),
          )
        ],
      ),
    );
  }
}
