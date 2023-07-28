import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  void initState() {
    // super.initState();
    _Check();
  }

  void _Check() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
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
                    top: 10, left: 20, right: 20, bottom: 100),
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
                      'Settings',
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100, bottom: 10),
                      child: SizedBox(
                        width: 140,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                          },
                          child: const Text(
                            'Sign Out',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: SizedBox(
                        width: 140,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            'Verification',
                            style: TextStyle(fontSize: 17),
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
