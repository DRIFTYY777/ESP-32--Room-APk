import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:that_esp/Settings.dart';
import 'package:that_esp/SignIn.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:percent_indicator/percent_indicator.dart';

var db;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  db = FirebaseFirestore.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'That Esp',
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
      home: const MyHomePage(
        title: 'That Esp',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _Login_Acc() {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user != null) {
        const snackBar = SnackBar(
          content: Text('User is signed in!'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignIn()),
        );
      }
    });
  }

  void _Settings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Setting()),
    );
  }

  @override
  void initState() {
    //super.initState();
    _Login_Acc();
    getData();
  }

  double temp = 0;
  double humi = 0;

  void getData() {
    final docRef = db.collection("kharwan").doc("Roof_1");
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print(data);
        temp = doc.get("temperature");
        humi = doc.get("humidity");
        setState(() {});
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ignore: unnecessary_new
            new CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 13.0,
              animation: true,
              percent: temp / 100,
              // ignore: unnecessary_new
              center: Text(
                "Temperature\n      $temp°",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: Colors.black,
              progressColor: const Color.fromARGB(255, 0, 255, 191),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              // ignore: unnecessary_new
              child: new CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 13.0,
                animation: true,
                percent: humi / 100,
                // ignore: unnecessary_new
                center: Text(
                  "Humidity\n   $humi%",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                backgroundColor: Colors.black,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: const Color.fromARGB(255, 0, 255, 191),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _Settings();
        },
        tooltip: 'Settings',
        child: const Icon(Icons.settings),
      ),
    );
  }
}
