import 'package:chal_twitter_onboarding/features/authentication/initial_screen.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const TwitterApp());
}

class TwitterApp extends StatelessWidget {
  const TwitterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(title: 'TwitterApp', home: InitialScreen());
  }
}
