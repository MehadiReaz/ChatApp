import 'package:chatapp/presentation/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 100, left: 16, right: 16, bottom: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/mail.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Login to your Account',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration: InputDecoration(
                      isDense: true, // Added this
                      contentPadding: EdgeInsets.all(15), // Added this
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      labelText: 'Email',
                      hintText: 'Example@outlook.com'),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  obscureText: _obscured,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (_obscured == false) {
                                _obscured = true;
                              } else {
                                _obscured = false;
                              }
                            });
                          },
                          icon: _obscured
                              ? Icon(Icons.remove_red_eye)
                              : Icon(Icons.remove_red_eye_rounded)),
                      isDense: true, // Added this
                      contentPadding: EdgeInsets.all(15), // Added this
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      labelText: 'Password',
                      hintText: '****'),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: () => Get.offAll(() => HomeScreen()),
                    child: const Text('Login')),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {}, child: const Text('Forgot Password')),
                const Divider(
                  color: Colors.grey,
                  thickness: .5,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(child: Text('Login or Signup with')),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Container(
                    height: 40,
                    padding: EdgeInsets.all(8),
                    child: Image.asset(
                      'assets/images/google.png',
                    ),
                  ),
                  label: RichText(
                    text: const TextSpan(children: [
                      TextSpan(text: 'Login or Signup with '),
                      TextSpan(
                          text: 'Google',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
