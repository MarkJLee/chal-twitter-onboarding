import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'create_account_screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: FaIcon(
                  FontAwesomeIcons.twitter,
                  size: 30,
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              const Text(
                "See what's happening in the world right now.",
                style: TextStyle(
                  fontFamily: 'helvetica neue',
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: CupertinoColors.lightBackgroundGray, width: 1.0),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: CupertinoButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.google,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Continue with Google",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: CupertinoColors.lightBackgroundGray, width: 1.0),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: CupertinoButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.apple,
                        color: Colors.black,
                        size: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Continue with Apple",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade500,
                    ),
                  ), // 왼쪽 선
                  const Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.0), // 'or' 양 옆의 간격 조정
                    child: Text(
                      'or',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade500,
                    ),
                  ), // 오른쪽 선
                ],
              ),
              CupertinoButton(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black,
                onPressed: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => const CreateAccountScreen()),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create account",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(text: 'By signing up, you agree to our '),
                    TextSpan(
                      text: 'Terms',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // 여기에 'Terms' 링크를 클릭했을 때의 동작
                        },
                    ),
                    const TextSpan(text: ', '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // 'Privacy Policy' 링크를 클릭했을 때의 동작
                        },
                    ),
                    const TextSpan(text: ', and '),
                    TextSpan(
                      text: 'Cookie Use',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // 'Cookie Use' 링크를 클릭했을 때의 동작
                        },
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(text: "Have an account already? "),
                        TextSpan(
                          text: "Log in",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
