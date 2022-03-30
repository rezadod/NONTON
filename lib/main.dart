import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nonton_app/service/auth_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: () async {
                SignInSignUpResult result = await AuthServices.signUp(
                  "rezwewqea@gmail.com",
                  "rezapurowoidood",
                  "Reza Wudidi",
                  ["Action", "Horror", "Music", "Drama"],
                  "Korea",
                );

                if (result.user == null) {
                  print(result.message);
                } else {
                  print(result.user.toString());
                }
              },
              child: Text('Sign Up'),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () async {
                SignInSignUpResult result = await AuthServices.signIn(
                  "rezwewqea@gmail.com",
                  "rezapurowoidood",
                );

                if (result.user == null) {
                  print(result.message);
                } else {
                  print(result.user.toString());
                }
              },
              child: Text('Login'),
            )
          ]),
        ),
      ),
    );
  }
}
