import 'package:chal_twitter_onboarding/features/authentication/main_interests_screen.dart';
import 'package:chal_twitter_onboarding/features/authentication/widgets/green_check_mark_widget.dart';
import 'package:chal_twitter_onboarding/features/authentication/widgets/twitter_navigation_bar_widget.dart';
import 'package:flutter/cupertino.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = "";
  bool _obscureText = true;

  bool _isValidPassword(String password) {
    if (password.length >= 8) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: TwitterNavigationBarWidget().build(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "You'll need a password",
              style: TextStyle(
                fontFamily: 'helvetica neue',
                fontSize: 33,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Make sure it's 8 characters or more.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            if (_passwordController.text.isNotEmpty)
              const Padding(
                padding: EdgeInsets.only(left: 6),
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            CupertinoTextField(
                controller: _passwordController,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: CupertinoColors.systemGrey,
                      width: 0.5,
                    ),
                    top: BorderSide.none,
                    left: BorderSide.none,
                    right: BorderSide.none,
                  ),
                ),
                placeholderStyle: const TextStyle(color: CupertinoColors.black),
                placeholder: "Password",
                obscureText: _obscureText,
                style: const TextStyle(
                  color: CupertinoColors.systemCyan,
                ),
                suffix: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? CupertinoIcons.eye_slash
                              : CupertinoIcons.eye,
                          size: 28,
                          color: CupertinoColors.systemGrey,
                        ),
                      ),
                    ),
                    if (_isValidPassword(_password))
                      const GreenCheckMarkWidget()
                  ],
                ),
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            CupertinoButton(
              borderRadius: BorderRadius.circular(30),
              color: CupertinoColors.black,
              disabledColor: CupertinoColors.systemGrey,
              onPressed: _isValidPassword(_password)
                  ? () => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const MainInterestsScreen()),
                      )
                  : null,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Next",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CupertinoColors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
