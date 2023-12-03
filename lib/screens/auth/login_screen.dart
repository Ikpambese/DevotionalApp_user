import 'package:flutter/material.dart';
import 'package:newlifedevotional/widget/theme_button.dart';
import 'package:provider/provider.dart';

import '../../service/provider_service.dart';
import '../../widget/google_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        body: Container(
            color: Colors.black,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.3,
                    child: Image.asset('assets/imgs/angel.jpeg',
                        fit: BoxFit.cover),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: ClipOval(
                          child: Container(
                            width: 180,
                            height: 180,
                            color: Colors.deepPurple,
                            alignment: Alignment.center,
                            child: ClipOval(
                              child: Container(
                                width: 150,
                                height: 150,
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/imgs/logo.jpg',
                                  width: 130,
                                  height: 130,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      const Text('Angel Gabriel \n   Devotional',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 40),
                      const Text('New Life.\nWorld Church',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      const SizedBox(height: 40),
                      Column(
                        children: <Widget>[
                          if (userProvider.user == null)
                            ThemeButton(
                              label: "Anonymous",
                              labelColor: Colors.white,
                              color: Colors.transparent,
                              highlight: Colors.deepPurple.withOpacity(0.5),
                              borderColor: Colors.deepPurple,
                              borderWidth: 4,
                              onClick: () async {
                                userProvider.signInAnonymously();
                              },
                            ),
                          GoogleLoginButton(
                            onPressed: () {
                              // Handle Google sign-in logic here
                              userProvider.signInWithGoogle();
                            },
                          ),
                          if (userProvider.user != null)
                            ElevatedButton(
                              onPressed: () => userProvider.signOut(),
                              child: const Text('Sign out'),
                            ),
                          if (userProvider.user != null)
                            Text(
                                'Logged in as: ${userProvider.user!.displayName ?? 'Anonymous'}'),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
