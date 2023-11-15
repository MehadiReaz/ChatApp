import 'package:chatapp/presentation/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          padding: const EdgeInsets.fromLTRB(16, 30, 16, 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/login.png'),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration: InputDecoration(
                    isDense: true, // Added this
                    contentPadding: EdgeInsets.all(15), // Added this
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    //labelText: 'Email',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Passward',
                  ),
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
