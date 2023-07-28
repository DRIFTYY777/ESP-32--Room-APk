import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:that_esp/Register.dart';
import 'package:that_esp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = '', password = '';
  ////////////////////
  void _RegisterAcc() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Register()),
    );
  }

  void _signIn(String Email, String Password) async {
    String sEmail = Email.replaceAll(' ', '');

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(sEmail);
    if (emailValid == true) {
      print('\n\n\n\n\nEmail is correct\n\n\n');
    } else {
      const snackBar = SnackBar(
        content: Text('Wrong email format'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    if (!Password.isNotEmpty) {
      const snackBar = SnackBar(
        content: Text('Enter Password'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: sEmail, password: Password);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(title: ''),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        const snackBar = SnackBar(
          content: Text('Account not existed'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (e.code == 'wrong-password') {
        const snackBar = SnackBar(
          content: Text('Wrong password'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 320,
                height: 500,
                padding: const EdgeInsets.only(
                    top: 100, left: 20, right: 20, bottom: 100),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Color.fromARGB(255, 36, 36, 36),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,  //automatic spacing between things
                  mainAxisSize: MainAxisSize
                      .min, //manual spacing between things using padding
                  children: [
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(
                      child: TextField(
                        decoration: const InputDecoration(
                          label: Text('Gmail'),
                        ),
                        style: const TextStyle(
                            fontStyle: FontStyle.normal, fontSize: 20),
                        cursorWidth: 1,
                        onChanged: ((v) {
                          setState(() {
                            email = v;
                          });
                        }),
                      ),
                    ),

                    TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('Password'),
                      ),
                      style: const TextStyle(
                          fontStyle: FontStyle.normal, fontSize: 20),
                      cursorWidth: 1,
                      onChanged: (v) {
                        setState(() {
                          password = v;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      child: SizedBox(
                        width: 140,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            _signIn(email, password);
                          },
                          child: const Text(
                            'Sign In',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),

                    // ignore: prefer_const_constructors
                    InkWell(
                      child: const Text(
                        'Create a new account',
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                      onTap: () {
                        _RegisterAcc();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
