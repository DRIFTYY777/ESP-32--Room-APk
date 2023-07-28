import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'SignIn.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  ///////////////

  void _Goto_SignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignIn()),
    );
  }

  String email = '', password = '', re_enter = '';

  void _Register(String Email, String Password, String Re_Enter) async {
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
    if (Password == Re_Enter) {
      if (Re_Enter.length < 8) {
        const snackBar = SnackBar(
          content: Text('Password smaller than 8'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        try {
          final credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: sEmail,
            password: Password,
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            const snackBar = SnackBar(
              content: Text('The password is too weak.'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (e.code == 'email-already-in-use') {
            _Goto_SignIn();
            const snackBar = SnackBar(
              content: Text('Email already exists'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        } catch (e) {
          print(e);
        }
      }
    } else {
      const snackBar = SnackBar(
        content: Text('Wrong Password'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween, //automatic spacing between things
                  mainAxisSize: MainAxisSize
                      .min, //manual spacing between things using padding
                  children: [
                    const Text(
                      'Register',
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
                      onChanged: ((v) {
                        setState(() {
                          password = v;
                        });
                      }),
                    ),
                    TextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('Re-Enter'),
                      ),
                      style: const TextStyle(
                          fontStyle: FontStyle.normal, fontSize: 20),
                      cursorWidth: 1,
                      onChanged: ((v) {
                        setState(() {
                          re_enter = v;
                        });
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: 140,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            _Register(email, password, re_enter);
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
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
