// ignore_for_file: use_build_context_synchronously

import 'package:click_game/pages/forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({super.key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  void signIn() async {
    // show loading circle

    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blueAccent,
              backgroundColor: Color.fromARGB(20, 30, 40, 50),
            ),
          );
        });

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text, password: password.text);

      // pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);

      // wrong email
      if (e.code == 'user-not-found') {
        // show error to user
        wrongEmailMessage();
      }

      // wrong password
      else if (e.code == 'wrong-password') {
        // show error to user
        wrongPasswordMessage();
      }
    }
  }

  // wrong email message popup
  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect Email'),
          );
        });
  }

  // wrong passwprd message popup
  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Incorrect Password'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),

            // logo
            const Icon(
              Icons.lock,
              size: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            // welcome back we have missed you
            const Text(
              "Welcome back, you've been missed",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 10,
            ),

            // username textfield which is email
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: email,
                textAlign: TextAlign.left,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Email',
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: password,
                textAlign: TextAlign.left,
                obscureText: passwordVisible,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: 'Password',
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(
                        () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 4,
            ),

            // forgot password?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ForgotPasswordPage();
                      }));
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Colors.blue[600], fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            // sign in button

            GestureDetector(
              onTap: signIn,
              child: Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            // or continue with
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.amber[1000],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Text(
                      'Or Continue With',
                      style: TextStyle(
                        color: Colors.amber[900],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.amber[1000],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            // google + apple sign in buttons

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // google icon

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[200],
                  ),
                  child: Image.asset(
                    'lib/images/googleicon.png',
                    height: 40,
                  ),
                ),

                const SizedBox(
                  width: 25,
                ),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[200],
                  ),
                  child: Image.asset(
                    'lib/images/appleicon.png',
                    height: 40,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // not a memnber? Register now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(
                  width: 100,
                ),
                GestureDetector(
                  onTap: widget.showRegisterPage,
                  child: const Text(
                    'Register Now',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
