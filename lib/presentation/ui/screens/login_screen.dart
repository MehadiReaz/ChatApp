import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/login.png'),
                Text('Login'),
                TextField(),
                TextField(),
                ElevatedButton(onPressed: () {}, child: const Text('Login')),
                TextButton(
                    onPressed: () {}, child: const Text('Forgot Password')),
                const Divider(
                  color: Colors.grey,
                  thickness: .5,
                ),
                const Text('Login or Signup with'),
                Container(
                  width: 300,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google.png',
                        fit: BoxFit.cover,
                        height: 35,
                      ),
                      Image.asset(
                        'assets/images/facebook.png',
                        fit: BoxFit.cover,
                        //height: 40,
                      ),
                    ],
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
