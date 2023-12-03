import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newlifedevotional/screens/auth/login_screen.dart';
import 'package:newlifedevotional/screens/select_service.dart';
import 'package:newlifedevotional/splash_screen.dart';
import 'package:provider/provider.dart';
import 'service/provider_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MySplashScreen(),
      ),
    );
  }
}

class AuthChecker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return FutureBuilder(
      future: userProvider
          .checkUserLoggedIn(), // Implement this method in UserProvider
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show a loader while checking auth state
        } else {
          if (snapshot.hasData && snapshot.data!) {
            return const SelectService(); // User is already logged in
          } else {
            return const LoginPage(); // User needs to log in
          }
        }
      },
    );
  }
}
